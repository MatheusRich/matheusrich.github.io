require 'date'

# Runs development server
def s
  system 'npx gulp'
end

# Creates a new post
# 
# @param post_name [String] name of the post to be created.
# @param tags [Array(String)] tags of the post.
def post(post_name, tags: 'ruby')
  time = Time.now
  file_name = time.to_date.to_s + '-' + Slugify.(post_name) + '.md'

  File.write(POSTS_PATH + file_name, FileContent.(post_name, time, tags))
end

# Constants
POSTS_PATH = '_posts/'

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

