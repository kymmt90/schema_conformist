module SchemaConformist
  class Railtie < Rails::Railtie
    config.before_configuration do
      config.schema_conformist = ActiveSupport::OrderedOptions.new
      config.schema_conformist.ignored_api_paths = []
      config.schema_conformist.schema_path = nil
      config.schema_conformist.committee = ActiveSupport::OrderedOptions.new
      config.schema_conformist.committee.old_assert_behavior = false
      config.schema_conformist.committee.parse_response_by_content_type = false
    end
  end
end
