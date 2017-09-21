# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_timeseries/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_timeseries"
  spec.version       = RailsTimeseries::VERSION
  spec.authors       = ["JonghunYu"]
  spec.email         = ["yuzong@naver.com"]

  spec.summary       = %q{rails gem generating time series data of active records}
  spec.description   = %q{rails gem generating time series data of active records. This is useful when you need a chart for number of active users or transactions}
  spec.homepage      = "https://github.com/nerdyfactory/rails_timeseries"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 5.0"
  spec.add_dependency "whenever"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-activemodel-mocks"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry"
end
