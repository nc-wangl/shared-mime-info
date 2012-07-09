# -*- encoding: utf-8 -*-

require File.expand_path('../lib/shared-mime-info/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniel Vandersluis", "Tim Olsen", "Mael Clerambault"]
  gem.email         = ["daniel@codexed.com", "tolsen@alum.mit.edu", "mael@clerambault.fr"]
  gem.summary       = %q{Library to guess the MIME type of a file with both filename lookup and magic file detection}
  gem.homepage      = "http://www.github.com/talentnest/shared-mime-info"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "shared-mime-info"
  gem.require_paths = ["lib"]
  gem.version       = SharedMimeInfo::VERSION
  
  gem.add_dependency "mime-types"
end
