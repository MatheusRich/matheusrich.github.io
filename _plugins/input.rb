module Input
  extend self

  def parse(input)
    image_path, *unparsed_opts = split_by_space_not_inside_quotes(input).reject(&:empty?)
    hash_body = unparsed_opts.map { _1.sub('=',':') }.join(',')
    opts_hash = "{ #{hash_body } }"
    opts = eval(opts_hash)

    [image_path, opts]
  end

  private

  def split_by_space_not_inside_quotes(input)
    input.strip.split(/\s(?=(?:[^"]|"[^"]*")*$)/)
  end
end