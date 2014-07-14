# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "preambular/version"

Gem::Specification.new do |s|
  s.name        = "preambular"
  s.version     = Preambular::VERSION
  s.authors     = ["Starr Horne", "Duane Johnson"]
  s.email       = ["starr@chromahq.com", "duane.johnson@gmail.com"]
  s.homepage    = "https://github.com/wordtreefoundation/preambular"
  s.summary     = %q{Use and save yaml preambles in your documents & templates}
  s.description = %q{Allows you to add YAML front matter to your templates. Useful for adding metadata to static pages}

  s.rubyforge_project = "preambular"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/**`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'rspec'
end
