module SchemaConformist
  module Driver
    include Committee::Test::Methods

    def committee_options
      { schema: committee_schema }
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
        when :open_api_3
          Rails.root.join('public', 'openapi.json')
        else
          raise SchemaConformist::Error.new("#{driver_name} is unknown driver")
        end
      end
    end

    def request_object
      request
    end

    def response_data
      [response.status, response.headers, response.body]
    end

    private

    def driver_name
      Rails.application.config.schema_conformist.driver
    end

    def committee_schema
      @commitee_schema = case driver_name
                         when :hyper_schema, :open_api_2, :open_api_3
                           Committee::Drivers::load_from_file(schema_path)
                         else
                           nil
                         end
    end
  end
end
