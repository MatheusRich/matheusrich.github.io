require_relative 'input'

module Jekyll
  class PictureTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @image_path, @options = Input.parse(input)
      @caption = nil
    end

    def render(context)
      html = <<~HTML
        <figure class="#{@options[:class]}">
          #{image_tag(@image_path)}
          #{figcaption_tag(@options[:caption])}
        </figure>
      HTML

      Liquid::Template.parse(html).render(context)
    end

    private

    def image_tag(path, alt: nil)
      %(<img loading="lazy" style="display: block; margin: 0 auto;" src="/assets/img/#{path}" alt="#{alt}">)
    end

    def figcaption_tag(caption)
      return if caption.nil?

      "<figcaption>#{caption}</figcaption>"
    end
  end
end

# module Jekyll
#   class CodeTag < Liquid::Tag

#     def initialize(tag_name, text, tokens)
#       super
#       @text = text
#     end

#     def render(context)
#       "#{@text} #{Time.now}"
#     end
#   end
# end

# module Jekyll
#   class LinkToPostTag < Liquid::Tag

#     def initialize(tag_name, text, tokens)
#       super
#       @text = text
#     end

#     def render(context)
#       "#{@text} #{Time.now}"
#     end
#   end
# end

Liquid::Template.register_tag('picture', Jekyll::PictureTag)
# Liquid::Template.register_tag('link_to_post', Jekyll::RenderTimeTag)