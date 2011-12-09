# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_seo_fields/version"

Gem::Specification.new do |s|
  s.name        = "has_seo_fields"
  s.version     = HasSeoFields::VERSION
  s.authors     = ["Nick Erlikh"]
  s.email       = ["n.erlikh@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Allows to easily add SEO fields for models}
  s.description = %q{Allows to easily add SEO fields for models}

  s.rubyforge_project = "has_seo_fields"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_dependency "activerecord", "~> 3.0"
  s.add_dependency "activesupport", "~> 3.0.0"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.7"
  s.add_development_dependency "sqlite3-ruby"
end
