$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "public_tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "public_tracker"
  s.version     = PublicTracker::VERSION
  s.authors     = ["Pete Michaud"]
  s.email       = ["pete@7ey.es"]
  s.homepage    = "https://github.com/7EyesLLC/public_tracker"
  s.summary     = "Public Tracker is a Rails Mountable Engine that injects a reporting overlay for rails applications that ties into PivotalTracker in order to provide in-app bug reporting and feature requests."
  s.description = "Public Tracker is a Rails Mountable Engine that injects a reporting overlay for rails applications that ties into PivotalTracker in order to provide in-app bug reporting and feature requests."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "mysql2"
end
