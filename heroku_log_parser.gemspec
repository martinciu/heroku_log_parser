# -*- encoding: utf-8 -*-
require File.expand_path('../lib/heroku_log_parser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcin Ciunelis"]
  gem.email         = ["marcin.ciunelis@gmail.com"]
  gem.description   = %q{Heroku Log Parser}
  gem.summary       = %q{Takes heroku log line as input and gives JSON output}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "heroku_log_parser"
  gem.require_paths = ["lib"]
  gem.version       = HerokuLogParser::VERSION

  gem.add_dependency "json"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "json_spec"
end
