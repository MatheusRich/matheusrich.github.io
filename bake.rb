require 'date'

# @param post_name [String] name of the post to be created.
# @param categores [Array(String)] categories of the post.
def post(post_name, categories: 'ruby')
  time = Time.now
  file_name = time.to_date.to_s + '-' + Slugify.(post_name) + '.md'

  File.write(POSTS_PATH + file_name, FileContent.(post_name, time, categories))
end

# Constants
POSTS_PATH = '_posts/'

# Helpers
Slugify = ->(str) { str.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') }
Titleize = ->(str) { str.split.map { |word| word.capitalize }.join(' ')  }
FileContent = ->(post_name, time, categories) do
  <<~CONTENT
  ---
  layout: post
  title: "#{Titleize.(post_name)}"
  date: #{time.to_s}
  categories: #{categories.split.map { |word| word.downcase }.join(' ')}
  ---
  CONTENT
end

