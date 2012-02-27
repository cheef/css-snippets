require 'active_support/core_ext/string/inflections'

module CssSnippets::Renderer

  SNIPPETS = %w(
    justified_items
    right_menu_liquid_layout
  ).freeze

  autoload :Base, "css-snippets/renderer/base"

  SNIPPETS.each do |snippet_name|
    autoload :"#{snippet_name.camelize}", "css-snippets/renderer/#{snippet_name}"
  end

  def self.render_html helper, snippet_name, options, &block
    snippet_instance(snippet_name, helper).to_html(options, &block)
  end

  private

    def self.snippet_instance name, helper
      snippet_klass(name).new(helper)
    end

    def self.snippet_klass name
      stringified_name = name.to_s
      raise "Unknown snippet #{stringified_name}" if not SNIPPETS.include?(stringified_name)
      "CssSnippets::Renderer::#{stringified_name.camelize}".constantize
    end

end