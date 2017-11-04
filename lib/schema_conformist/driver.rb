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
      Rails.application.config.schema_conformist.schema_path
    end

    def driver
      driver_name = Rails.application.config.schema_conformist.driver
      case driver_name
      when :open_api_2
        Committee::Drivers::OpenAPI2.new
      else
        raise SchemaConformist::Error.new("#{driver_name} is unknown driver")
      end
    end
  end
end
