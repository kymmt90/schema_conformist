module SchemaConformist
  module OpenAPI2
    include Committee::Rails::Test::Methods

    def committee_schema
      @committee_schema ||=
        begin
          driver = Committee::Drivers::OpenAPI2.new
          schema_hash = JSON.parse(File.read(schema_path))
          driver.parse(schema_hash)
        end
    end

    def schema_path
      Rails.application.config.schema_conformist.schema_path
    end
  end
end
