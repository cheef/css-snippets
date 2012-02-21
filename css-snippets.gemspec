# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "css-snippets/version"

Gem::Specification.new do |s|
  s.name        = "css-snippets"
  s.version     = CssSnippets::VERSION
  s.authors     = ["Ivan Garmatenko"]
  s.email       = %w(cheef.che@gmail.com)
  s.homepage    = ""
  s.summary     = %q{Provides a useful css snippets}
  s.description = %q{Provides a useful css snippets}

  s.add_runtime_dependency "compass"

  s.files = []
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)
end
