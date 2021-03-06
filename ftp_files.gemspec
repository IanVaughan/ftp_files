# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ftp_files/version'

Gem::Specification.new do |spec|
  spec.name          = "ftp_files"
  spec.version       = FtpFiles::VERSION
  spec.authors       = ["Ian Vaughan"]
  spec.email         = ["github@ianvaughan.co.uk"]
  spec.summary       = %q{List Files on a FTP site}
  spec.description   = %q{It iterates all directories, listing the files within each as it goes}
  spec.homepage      = "https://github.com/IanVaughan/ftp_files"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
