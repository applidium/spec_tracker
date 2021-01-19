
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spec_tracker/version"

Gem::Specification.new do |spec|
  spec.name          = "spec_tracker"
  spec.version       = SpecTracker::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ["Joanna Vigné"]
  spec.email         = ["joanna.vigne@fabernovel.com"]

  spec.summary       = %q{Track tests that validate specification use cases}
  spec.description   = %q{Get an overview of your project traceability matrix.}
  spec.homepage      = %q{https://github.com/applidium/spec_tracker}

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.0", "< 3.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", ">= 5.14"
  spec.add_development_dependency "byebug", "~> 11.1"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
  spec.add_development_dependency "activesupport", "~> 6.1"
  spec.add_dependency "nokogiri", ">= 1.1", "< 2.0"
  spec.add_dependency "terminal-table", "~> 2.0"
  spec.add_dependency "gemoji", "~> 3.0"
  spec.add_dependency "thor", "~> 1.0"
  spec.add_dependency "cucumber", "~> 5.2"

  spec.required_ruby_version     = ">= 2.6"
end
