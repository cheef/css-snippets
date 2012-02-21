require "css_snippets/version"

if defined? ::Rails
  require 'css_snippets/engine'
end

require 'compass'
Compass::Frameworks.register "css_snippets", :path => "#{File.dirname(__FILE__)}/.."

module CssSnippets
  # Your code goes here...
end