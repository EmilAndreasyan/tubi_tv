lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tubi_tv/version"

Gem::Specification.new do |spec|
  spec.name          = "tubi_tv"
  spec.version       = TubiTv::VERSION
  spec.authors       = ["Emil_Andreasyan"]
  spec.email         = ["emil.andreasyan@yahoo.com"]

  spec.summary       = %q{Project TubiTV}
  spec.description   = %q{Application to extract movies from site}
  spec.homepage      = "https://tubitv.com/"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://tubitv.com/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EmilAndreasyan/tubi_tv.git"
  spec.metadata["changelog_uri"] = "https://tubitv.com/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency "nokogiri"
end
