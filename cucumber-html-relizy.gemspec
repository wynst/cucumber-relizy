# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cucumber-html-relizy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["wynst"]
  gem.email         = ["wynst.uei@gmail.com"]
  gem.description   = %q{Patch your cucumber html output with features navigation}
  gem.summary       = %q{Patch your cucumber html output with features navigation}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "cucumber-html-relizy"
  gem.require_paths = ["lib"]
  gem.version       = Cucumber::Html::Relizy::VERSION

  gem.add_dependency 'coffee-script'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rake'
end
