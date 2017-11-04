require 'committee'
require 'committee/rails'
require 'schema_conformist/railtie'
require 'schema_conformist/driver'
require 'schema_conformist/assert_schema_conform_available'
require 'action_dispatch/integration'

module SchemaConformist
  class Error < StandardError; end
end
