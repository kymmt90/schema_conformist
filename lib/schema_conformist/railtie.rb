module SchemaConformist
  class Railtie < Rails::Railtie
    config.before_configuration do
      config.schema_conformist = Configuration.new
    end

    initializer 'config.schema_conformist.schema_path' do
      config.schema_conformist.schema_path = nil
    end

    initializer 'config.schema_conformist.ignored_api_paths' do
      config.schema_conformist.ignored_api_paths = []
    end

    initializer 'config.schema_conformist.driver' do
      config.schema_conformist.driver = :hyper_schema
    end
  end
end
