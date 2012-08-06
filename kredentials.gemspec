# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kredentials/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bookrenter/Rafter"]
  gem.email         = ["cp@bookrenter.com"]
  gem.description   = %q{Gem allows to define config constants for different Rails environments.}
  gem.summary       = %q{Gem allows to define config constants for different Rails environments.}
  gem.homepage      = "https://github.com/bkr/kredentials"

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'supermodel'
  
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "kredentials"
  gem.require_paths = ["lib"]
  gem.version       = Kredentials::VERSION
end
