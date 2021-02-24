require 'date'
require 'fileutils'

# Runs development server
def s
  system 'npx gulp'
end

# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param tags [Array(String)] tags of the post.
def post(post_name, tags: ['ruby'])
  time = Time.now
  file_name = time.to_date.to_s + '-' + Slugify.(post_name) + '.md'

  File.write(POSTS_PATH + file_name, FileContent.(post_name, time, tags))
end

# Creates a new draft
#
# @param draft_name [String] name of the draft to be created.
# @param tags [Array(String)] tags of the draft.
def draft(draft_name, tags: ['ruby'])
  time = Time.now
  file_name = Slugify.(draft_name) + '.md'

  File.write(DRAFTS_PATH + file_name, FileContent.(draft_name, time, tags))
end

# Publishes a draft
#
# @param draft_name [String] name of the draft to be published. If not given, the first one from `_drafts` will be published.
def publish(draft_name = nil)
  time = Time.now
  article_name = Dir["_drafts/*.md"].first.split('/').last
  old_file_path = "_drafts/#{article_name}"
  new_file_path = "_posts/#{time.to_date}-#{article_name}"

  FileUtils.mv(old_file_path, new_file_path)
  new_content = File.open(new_file_path, &:read).gsub(/date: \K(.*)/, time.to_s)
  File.write(new_file_path, new_content)
end

# Constants
POSTS_PATH = '_posts/'
DRAFTS_PATH = '_drafts/'

# Helpers
Slugify = ->(str) { str.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') }
Titleize = ->(str) { str.split.map { |word| word.capitalize }.join(' ')  }
FileContent = ->(post_name, time, tags) do
  <<~CONTENT
  ---
  layout: post
  title: "#{Titleize.(post_name)}"
  date: #{time.to_s}
  categories: #{tags.join(' ')}
  ---
  CONTENT
end

