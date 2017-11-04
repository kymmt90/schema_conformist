require 'test_helper'

class SchemaConformist::Test < ActiveSupport::TestCase
  class DriverTestClass < Object
    include SchemaConformist::Driver
  end

  setup do
    Rails.application.config.schema_conformist.driver = :unknown_driver
  end

  teardown do
    Rails.application.config.schema_conformist.driver = :open_api_2
  end

  test 'unknown driver is specified' do
    assert_raises(SchemaConformist::Error) { DriverTestClass.new.driver }
  end
end
