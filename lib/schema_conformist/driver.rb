module SchemaConformist
  module Driver
    include Committee::Rails::Test::Methods

    def committee_schema
      @committee_schema ||= driver.parse(schema_hash)
    end

    def schema_hash(schema_data = File.read(schema_path))
      if %w(.yaml .yml).include?(File.extname(schema_path))
        YAML.safe_load(schema_data)
      else
        JSON.parse(schema_data)
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
