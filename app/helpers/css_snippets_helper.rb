module CssSnippetsHelper
  def render_css_snippet snippet_name, options = {}, &block
    CssSnippets::Renderer.render_html self, snippet_name, options, &block
  end
end