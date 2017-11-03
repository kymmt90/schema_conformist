$:.push File.expand_path('../lib', __FILE__)

require 'schema_conformist/version'

Gem::Specification.new do |s|
  s.name        = 'schema_conformist'
  s.version     = SchemaConformist::VERSION
  s.authors     = ['Kohei Yamamoto']
  s.email       = ['kymmt90@gmail.com']
  s.homepage    = 'https://github.com/kymmt90/schema_conformist'
  s.summary     = ''
  s.description = ''
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'committee', '~> 2.0.0'
  s.add_dependency 'committee-rails', '~> 0.2.0'

  s.add_development_dependency 'sqlite3'
end
