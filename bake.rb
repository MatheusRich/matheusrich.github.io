require "date"
require "fileutils"
require_relative "lib/todo_list"

# Runs development server
def s
  system "bundle exec jekyll serve --drafts --livereload --incremental"
end
alias_method :call, :s

# Bake ignores what a task returns, so failures have to set the exit status
# here. Otherwise CI stays green while the checks below fail.
def lint
  checks = [
    "bundle exec jekyll doctor",
    "bundle exec bake unused_pictures",
    "bundle exec standardrb"
  ]

  exit 1 unless checks.all? { system(_1) }
end

# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param tags [Array(String)] tags of the post.
def post(post_name, tags: ["ruby"])
  time = Time.now

  File.write(post_file_path_for(post_name, time), file_content(post_name, time, tags))
end

# Creates a new draft
#
# @param draft_name [String] name of the draft to be created.
# @param tags [Array(String)] tags of the draft.
def draft(draft_name, tags: ["ruby"])
  draft_file_path = draft_file_path_for(draft_name)
  return if File.exist?(draft_file_path)

  time = nil

  File.write(draft_file_path, file_content(draft_name, time, tags))
end

# Publishes a draft
#
# @param draft [String] name of the draft to be published. If not given, the first one from `_drafts` will be published.
def publish(draft: "")
  time = Time.now
  first_draft_name = Dir["_drafts/*#{draft}*.md"].min.split("/").last
  old_file_path = "_drafts/#{first_draft_name}"
  new_file_path = "_posts/#{time.to_date}-#{first_draft_name}"

  FileUtils.mv(old_file_path, new_file_path)
  new_content = File.read(new_file_path).gsub(/date: \K(.*)/, time.to_s)
  File.write(new_file_path, new_content)
end

# Imports posts published on thoughtbot's blog into `_posts`.
#
# Each one becomes a stub with a `redirect_to` front matter: it shows up in the
# listings and gets a permalink here, but readers land on the original article.
# Posts already synced are left untouched, so this is safe to re-run.
#
# @param author [String] the author slug on thoughtbot's blog.
def sync_external_posts(author: "matheus-richard")
  require "net/http"
  require "nokogiri"
  require "yaml"

  created = []
  conflicting = []
  synced = 0

  each_external_post(author) do |post|
    existing_post = post_with_slug(post[:slug])

    if existing_post.nil?
      file_path = "#{POSTS_PATH}#{post[:date]}-#{post[:slug]}.md"
      File.write(file_path, external_post_content(post))
      created << file_path
    elsif external_post?(existing_post)
      synced += 1
    else
      conflicting << [post[:url], existing_post]
    end
  end

  created.each { puts "Created #{_1}" }
  puts "#{created.size} post(s) created, #{synced} already synced."

  if conflicting.any?
    puts "\nSkipped, already published here under the same slug:"
    conflicting.each { |url, path| puts "  #{url}\n    -> #{path}" }
  end
end

# Generates a draft "year in review" post for the last year.
# Also runs a todo script to get all the info needed.
def year_in_review
  puts "Year in Review Article To-do list (press Enter/Space to continue)"
  TodoList.todo("📝 Create draft article...", wait: false)
  year = Time.now.year - 1
  draft("#{year} in Review", tags: ["year-in-review"])
  FileUtils.mkdir_p("assets/img/#{year}-in-review")

  TodoList.todo(
    "🎵 Get Spotify Stats",
    subtasks: [
      "Spotify Wrapped",
      "stats.fm"
    ]
  )
  TodoList.todo("💻 Get Github Stats (https://www.githubwrapped.io/private)")
  TodoList.todo("💻 Get Wakatime Stats (https://wakatime.com/a-look-back-at-2025)")
  TodoList.todo("🎮 Get Playstation Stats (https://wrapup.playstation.com/en-us)")
  TodoList.todo("🌍 Get DuoLingo Stats")
  TodoList.todo(
    "📊 Get Open Source Stats",
    subtasks: [
      "RubyGems",
      "PRs opened (https://github.com/search?q=is%3Apr+author%3AMatheusRich++created%3A#{year}-01-01..#{year}-12-31+is%3Apublic+&type=pullrequests)",
      "PRs merged (https://github.com/search?q=is%3Apr+author%3AMatheusRich++merged%3A#{year}-01-01..#{year}-12-31+is%3Apublic+&type=pullrequests)",
      "Rails contributions (https://contributors.rubyonrails.org/contributors/matheus-richard/commits)",
      "Ruby-core commits (https://github.com/ruby/ruby/commits?author=matheusrich&since=#{year}-01-01&until=#{year}-12-31)",
      "Ruby Redmine (https://bugs.ruby-lang.org/activity?from=#{year}-01-01&user_id=49162)",
      "Talks"
    ]
  )
  TodoList.todo("📖 Article Stats")
  TodoList.todo("📚 Book stats")
  TodoList.todo("💪 Gym stats")
  TodoList.todo(
    "🎸 Music Stats",
    subtasks: [
      "Guitar gear",
      "Live performances",
      "Music released?"
    ]
  )
end

# Reports all the pictures in `assets/img` (and subdirectories) that are not being used.
def unused_pictures
  puts "Checking for unused pictures..."
  system "jekyll build --quiet --drafts"

  html_files = Dir["_site/**/*.html"].map { File.read _1 }
  unused = Dir["assets/img/**/*"].filter_map do |picture_path|
    next if File.directory?(picture_path)
    next if html_files.any? { _1.include?(picture_path) }

    picture_path
  end

  if unused.any?
    puts "Unused pictures:\n#{unused.join("\n")}"
    exit 1
  end
end

# Converts images to WebP format and updates references in posts/drafts.
#
# @param directory [String] directory to search for images.
# @param quality [Integer] WebP quality (1-100).
def optimize_images(directory, quality: 90)
  unless system("which cwebp > /dev/null 2>&1")
    abort "cwebp not found. Install it with: brew install webp"
  end

  image_files = Dir["#{directory}/**/*.{jpg,jpeg,png}"]

  if image_files.empty?
    puts "No images to optimize in #{directory}"
    return
  end

  total_before = 0
  total_after = 0
  converted = []

  image_files.each do |file|
    webp_path = file.sub(/\.(jpe?g|png)$/i, ".webp")

    if File.exist?(webp_path)
      puts "Skipping #{file} (WebP already exists)"
      next
    end

    before_size = File.size(file)
    total_before += before_size

    unless system("cwebp", "-q", quality.to_s, file, "-o", webp_path, [:out, :err] => "/dev/null")
      puts "Failed to convert #{file}"
      next
    end

    after_size = File.size(webp_path)
    total_after += after_size
    converted << {original: file, webp: webp_path}

    puts "#{file} → #{webp_path} (#{human_size(before_size)} → #{human_size(after_size)})"
  end

  if converted.any?
    puts "\nTotal: #{human_size(total_before)} → #{human_size(total_after)} (saved #{human_size(total_before - total_after)})"
    update_image_references(converted)
    converted.each { |pair| File.delete(pair[:original]) }
  end
end

POSTS_PATH = "_posts/"
DRAFTS_PATH = "_drafts/"
EXTERNAL_SITE_URL = "https://thoughtbot.com"

private

def slugify(str) = str.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")

def titleize(str) = str.split.map(&:capitalize).join(" ")

def post_file_path_for(title, time)
  "#{POSTS_PATH}#{time.to_date}-#{slugify(title)}.md"
end

def draft_file_path_for(title) = "#{DRAFTS_PATH}#{slugify(title)}.md"

def file_content(post_name, date, tags) = <<~CONTENT
  ---
  layout: post
  title: "#{titleize(post_name)}"
  #{if !!date then "date: #{date}" end}
  categories: #{tags.join(" ")}
  ---
CONTENT

# Stops when a page brings nothing new, which covers both an empty page and a
# `page` param that the blog decides to ignore.
def each_external_post(author)
  seen = []
  page = 1

  loop do
    url = "#{EXTERNAL_SITE_URL}/blog/authors/#{author}?page=#{page}"
    elements = Nokogiri::HTML(fetch(url)).css("li.mini-post")

    abort <<~MESSAGE if elements.empty? && page == 1
      Found no posts at #{url}.

      Either the author slug is wrong or the blog's HTML changed, so the
      selectors in this task need updating.
    MESSAGE

    posts = elements
      .map { parse_external_post(_1, url) }
      .reject { seen.include?(_1[:slug]) }

    break if posts.empty?

    posts.each do |post|
      seen << post[:slug]
      yield post
    end

    page += 1
  end
end

def external_post?(file_path)
  front_matter = File.read(file_path)[/\A---\s*\n(.*?)^---\s*$/m, 1].to_s
  data = YAML.safe_load(front_matter, permitted_classes: [Date, Time])

  data.is_a?(Hash) && data.key?("redirect_to")
end

def post_with_slug(slug)
  Dir["#{POSTS_PATH}*"].find do |file_path|
    File.basename(file_path).sub(/\A\d{4}-\d{2}-\d{2}-/, "").sub(/\.\w+\z/, "") == slug
  end
end

def fetch(url)
  response = Net::HTTP.get_response(URI(url))
  abort "Failed to fetch #{url} (#{response.code})" unless response.is_a?(Net::HTTPSuccess)

  response.body
end

def parse_external_post(element, page_url)
  link = element.at_css("h2.mini-post-title a")
  title = link&.text
  href = link&.[]("href")
  description = element.at_css("p.mini-post-teaser")&.text
  published_at = element.at_css("time.meta-date")&.[]("datetime")

  blank = {
    "h2.mini-post-title a" => title,
    "h2.mini-post-title a[href]" => href,
    "p.mini-post-teaser" => description,
    "time.meta-date[datetime]" => published_at
  }.filter_map { |selector, value| selector if value.to_s.strip.empty? }

  abort <<~MESSAGE unless blank.empty?
    Unexpected markup at #{page_url}.

    Missing or empty: #{blank.join(", ")}

    The blog's HTML changed, so the selectors in `parse_external_post` need
    updating. Posts already synced are unaffected.
  MESSAGE

  {
    title: title.strip,
    slug: File.basename(href),
    url: "#{EXTERNAL_SITE_URL}#{href}",
    description: description.strip,
    date: Date.parse(published_at),
    categories: element.css("ul.meta-tag-list a").map { slugify(_1.text) }
  }
end

def external_post_content(post)
  front_matter = {
    "layout" => "post",
    "title" => post[:title],
    "categories" => post[:categories].join(" "),
    "description" => post[:description],
    "redirect_to" => post[:url]
  }

  <<~CONTENT
    #{YAML.dump(front_matter, line_width: -1)}---

    This article was published on [thoughtbot's blog](#{post[:url]}).
  CONTENT
end

def human_size(bytes)
  units = ["B", "KB", "MB", "GB"]
  unit = units.shift
  while bytes >= 1024 && units.any?
    bytes /= 1024.0
    unit = units.shift
  end
  "%.1f %s" % [bytes, unit]
end

def update_image_references(converted)
  md_files = Dir["{#{POSTS_PATH},#{DRAFTS_PATH}}**/*.{md,markdown}"]
  return if md_files.empty?

  puts "\nUpdating image references in posts/drafts..."
  md_files.each do |md_file|
    content = File.read(md_file)
    original_content = content.dup

    converted.each do |pair|
      old_name = File.basename(pair[:original])
      new_name = File.basename(pair[:webp])
      content = content.gsub(old_name, new_name)
    end

    if content != original_content
      File.write(md_file, content)
      puts "  Updated #{md_file}"
    end
  end
end
