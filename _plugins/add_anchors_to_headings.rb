HEADINGS_WITH_ID = /<h([1-6])(.*?)id="([\w-]+)"(.*?)>(.*?)<\/h\1>/

Jekyll::Hooks.register :pages, :post_render do |doc|
  if doc.output_ext == ".html"
    # Note: if this turns out to be buggy, we can use something
    #       like Nogokiri to proper parse and generate HTML
    doc.output = doc.output.gsub(
      HEADINGS_WITH_ID,
      '<h\1\2id="\3"\4><a href="#\3">\5</a></h\1>'
    )
  end
end
