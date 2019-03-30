$:.push File.expand_path('../lib', __FILE__)

require 'schema_conformist/version'

Gem::Specification.new do |s|
  s.name        = 'schema_conformist'
  s.version     = SchemaConformist::VERSION
  s.authors     = ['Kohei Yamamoto']
  s.email       = ['kymmt90@gmail.com']
  s.homepage    = 'https://github.com/kymmt90/schema_conformist'
  s.summary     = 'An automatic JSON response validator for testing in Rails'
  s.description = 'SchemaConformist is an automatic JSON response validator for your API testing in Rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails'
  s.add_dependency 'committee-rails'
  s.add_dependency 'committee', '~> 3.0.1'

  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end
