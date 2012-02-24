require 'active_support/dependencies/autoload'

module CssSnippets

  autoload :Renderer, 'css-snippets/renderer'
  autoload :VERSION,  'css-snippets/version'

  def self.register_framework!
    require 'compass'
    Compass::Frameworks.register "css-snippets", :path => File.expand_path("#{File.dirname(__FILE__)}/../.")
  end

  def self.enable_rails_engine!
    require 'css-snippets/engine'
  end
end

CssSnippets.register_framework!
CssSnippets.enable_rails_engine! if defined?(::Rails)