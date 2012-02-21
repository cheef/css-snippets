module CssSnippets::Renderer

  def self.render_html template, snippet_name, options, &block
    CssSnippets::Snippets::JustifiedItems.new.to_html
  end

end