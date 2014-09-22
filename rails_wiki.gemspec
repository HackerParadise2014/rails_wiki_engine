$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_wiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_wiki"
  s.version     = RailsWiki::VERSION
  s.authors     = ["Troy Anderson"]
  s.email       = ["protected"]
  s.homepage    = "https://github.com/HackerParadise2014/rails_wiki_engine"
  s.summary     = "Rails Wiki is a simple engine to get you a markdown based wiki."
  s.description = "Rails Wiki is a simple engine to get you a markdown based wiki."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
end
