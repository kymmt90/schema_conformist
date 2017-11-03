$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "schema_conformist/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "schema_conformist"
  s.version     = SchemaConformist::VERSION
  s.authors     = ["Kohei Yamamoto"]
  s.email       = ["kymmt90@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SchemaConformist."
  s.description = "TODO: Description of SchemaConformist."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
