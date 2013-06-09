# -*- encoding: utf-8 -*-
require File.expand_path('../lib/newton-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joseph Silvashy"]
  gem.email         = ["jpsilvashy@gmail.com"]
  gem.description   = %q{A lean and simple front-end}
  gem.summary       = %q{CSS and JavaScript for simple and lean front-end development}
  gem.homepage      = "https://github.com/jpsilvashy/newton-rails"
  # gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "newton-rails"
  gem.require_paths = ["lib"]
  gem.version       = Newton::Rails::VERSION

  # gem.add_development_dependency "bundler", ">= 1.0"
end
