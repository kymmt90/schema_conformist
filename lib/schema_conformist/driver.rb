module SchemaConformist
  module Driver
    include Committee::Test::Methods

    def committee_options
      { schema: committee_schema }
    end

    def request_object
      request
    end

    def response_data
      [response.status, response.headers, response.body]
    end

    private

    def committee_schema
      @commitee_schema = Committee::Drivers::load_from_file(schema_path)
    end

    def schema_path
      Rails.application.config.schema_conformist.schema_path
    end
  end
end
