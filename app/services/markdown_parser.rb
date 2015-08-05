class MarkdownParser
  def self.call(txt)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(txt)
  end
end