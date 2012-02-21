require 'compass'

module CssSnippets
  def self.register!
    Compass::Frameworks.register "css-snippets", :path => File.expand_path(File.dirname(__FILE__), '/..')
  end
end

CssSnippets.register!