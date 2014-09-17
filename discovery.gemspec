$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "discovery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "discovery"
  s.version     = Discovery::VERSION
  s.authors     = ["Lauralee Flores"]
  s.email       = ["lauralee@majorfinder.com"]
  s.homepage    = "http://www.majorfinder.com/discovery"
  s.summary     = "Personality Test"
  s.description = "Explore your personality through a series of 50 questions. You can see the results before completing all 50 questions but the more questions you answer the more accurate the results."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
