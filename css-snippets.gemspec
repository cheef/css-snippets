# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "css-snippets/version"

Gem::Specification.new do |s|
  s.name        = "css-snippets"
  s.version     = CssSnippets::VERSION
  s.authors     = ["Ivan Garmatenko"]
  s.email       = %w(cheef.che@gmail.com)
  s.homepage    = "http://css-snippets.herokuapp.com"
  s.summary     = %q{Provides a useful css snippets and layouts}
  s.description = %q{Gem contains stylesheets and rails helpers which provides simple way to add useful css snippets to your site}

  s.rubyforge_project = 'css-snippets'

  s.require_paths = %w(lib)
  s.files = []

  %w(lib app stylesheets).each do |folder|
    s.files += Dir.glob("#{folder}/**/*.*")
  end

  s.add_runtime_dependency "compass"
  s.add_runtime_dependency "activesupport", '~> 3.1'
end
