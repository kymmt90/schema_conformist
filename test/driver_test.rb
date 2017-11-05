require 'test_helper'

class SchemaConformist::Driver::Test < ActiveSupport::TestCase
  class DriverTestClass < Object
    include SchemaConformist::Driver
  end

  teardown do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    Rails.application.config.schema_conformist.schema_path = nil
  end

  test '#driver returns the hyper schema driver' do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    assert_instance_of Committee::Drivers::HyperSchema, DriverTestClass.new.driver
  end

  test '#driver returns the OpenAPI 2 driver' do
    Rails.application.config.schema_conformist.driver = :open_api_2
    assert_instance_of Committee::Drivers::OpenAPI2, DriverTestClass.new.driver
  end

  test '#driver raises an error when the specified driver is unknown' do
    Rails.application.config.schema_conformist.driver = :unknown_driver
    assert_raises SchemaConformist::Error do
      DriverTestClass.new.driver
    end
  end

  test '#schema_path returns default hyper schema path when not specified' do
    Rails.application.config.schema_conformist.driver = :hyper_schema
    assert_equal Rails.root.join('public', 'schema.json'), DriverTestClass.new.schema_path
  end

  test '#schema_path returns default OpenAPI 2 schema path when not specified' do
    Rails.application.config.schema_conformist.driver = :open_api_2
    assert_equal Rails.root.join('public', 'swagger.json'), DriverTestClass.new.schema_path
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
