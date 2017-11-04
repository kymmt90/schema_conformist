module SchemaConformist
  class Railtie < Rails::Railtie
    config.before_configuration do
      config.schema_conformist = Configuration.new
    end

    initializer 'config.schema_conformist.schema_path' do
      config.schema_conformist.schema_path = Rails.root.join('public', 'swagger.json')
    end
  end
end
