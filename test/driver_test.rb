require 'test_helper'

class SchemaConformist::Driver::Test < ActiveSupport::TestCase
  class DriverTestClass < Object
    include SchemaConformist::Driver
  end

  setup do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    Rails.application.config.schema_conformist.ignored_api_paths = []
    Rails.application.config.schema_conformist.schema_path = nil
  end

  test '#schema_path returns default hyper schema path when not specified' do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    assert_equal Rails.root.join('public', 'schema.json'), DriverTestClass.new.schema_path
  end

  test '#schema_path returns default OpenAPI 2 schema path when not specified' do
    Rails.application.config.schema_conformist.driver = :open_api_2
    assert_equal Rails.root.join('public', 'swagger.json'), DriverTestClass.new.schema_path
  end

  test '#schema_path returns default OpenAPI 3 schema path when not specified' do
    Rails.application.config.schema_conformist.driver = :open_api_3
    assert_equal Rails.root.join('public', 'openapi.json'), DriverTestClass.new.schema_path
  end

  test '#schema_path returns the specified schema path when specified' do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    path = Rails.root.join('public', 'schema2.json')
    Rails.application.config.schema_conformist.schema_path = path
    assert_equal path, DriverTestClass.new.schema_path
  end

  test '#schema_path raises an error when the specified driver is unknown' do
    Rails.application.config.schema_conformist.driver = :unknown_driver
    assert_raises SchemaConformist::Error do
      DriverTestClass.new.schema_path
    end
  end
end
