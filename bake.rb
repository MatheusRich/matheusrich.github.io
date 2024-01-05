require "date"
require "fileutils"
require_relative "lib/todo_list"

# Runs development server
def s
  system "npx gulp"
end
alias_method :call, :s

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

# Generates a draft "year in review" post for the last year.
# Also runs a todo script to get all the info needed.
def year_in_review
  puts "Year in Review Article To-do list (press Enter/Space to continue)"
  TodoList.todo("📝 Create draft article...", wait: false)
  year = Time.now.year - 1
  draft("#{year} in Review", tags: ["year-in-review"])

  TodoList.todo(
    "🎵 Get Spotify Stats",
    subtasks: [
      "Spotify Wrapped",
      "stats.fm"
    ]
  )
  TodoList.todo("💻 Get Github Stats (https://www.githubwrapped.io/private)")
  TodoList.todo("🎮 Get Playstation Stats (https://wrapup.playstation.com/en-us)")
  TodoList.todo("🌍 Get DuoLingo Stats")
  TodoList.todo(
    "📊 Get Open Source Stats",
    subtasks: [
      "RubyGems",
      "PRs opened (https://github.com/search?q=is%3Apr+author%3AMatheusRich++created%3A#{year}-01-01..#{year}-12-31+is%3Apublic+&type=pullrequests)",
      "Rails contributions (https://contributors.rubyonrails.org/contributors/matheus-richard/commits)",
      "Talks"
    ]
  )
  TodoList.todo("📖 Article Stats")
  TodoList.todo(
    "🎸 Music Stats",
    subtasks: [
      "Guitar gear",
      "Live performances",
      "Songs learned?",
      "Music released?"
    ]
  )
end

private

POSTS_PATH = "_posts/"
DRAFTS_PATH = "_drafts/"

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
