module SchemaConformist
  module Driver
    include Committee::Rails::Test::Methods

    def committee_schema
      @committee_schema ||=
        begin
          schema_hash = JSON.parse(File.read(schema_path))
          driver.parse(schema_hash)
        end
    end

    def schema_path
      if schema_path = Rails.application.config.schema_conformist.schema_path
        schema_path
      else
        case driver_name
        when :hyper_schema
          Rails.root.join('public', 'schema.json')
        when :open_api_2
          Rails.root.join('public', 'swagger.json')
        else
          raise SchemaConformist::Error.new("#{driver_name} is unknown driver")
        end
      end
    end

    def driver
      case driver_name
      when :hyper_schema
        Committee::Drivers::HyperSchema.new
      when :open_api_2
        Committee::Drivers::OpenAPI2.new
      else
        raise SchemaConformist::Error.new("#{driver_name} is unknown driver")
      end
    end

    def driver_name
      Rails.application.config.schema_conformist.driver
    end
  end
end
