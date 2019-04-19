module SchemaConformist
  class Railtie < Rails::Railtie
    config.before_configuration do
      config.schema_conformist = Configuration.new
      config.schema_conformist.ignored_api_paths = []
      config.schema_conformist.schema_path = nil
    end
  end
end
