require_relative 'lib/stocks/version'

Gem::Specification.new do |spec|
  spec.name          = "stocks"
  spec.version       = Stocks::VERSION
  spec.authors       = ["botto54"]
  spec.email         = ["bryanlbottorff@gmail.com"]

  spec.summary       = "A gem used to get information on stocks"
  spec.description   = "Welcome to the Stock Ticker CLI, where you can retrieve a list of companies on the exchnage, their profiles, and much more!"
  spec.homepage      = "https://github.com/botto54/stocks"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/botto54/stocks"
  spec.metadata["changelog_uri"] = "https://github.com/botto54/stocks"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
