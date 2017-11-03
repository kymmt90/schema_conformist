module SchemaConformist
  module AssertSchemaConformAvailable
    include SchemaConformist::OpenAPI2

    def process(*args)
      super *args
      assert_schema_conform
    end
  end
end
