module SchemaConformist
  module ProcessWithAssertion
    include SchemaConformist::Driver

    def process(*args)
      super *args

      path = args[1]
      return if ignored?(path)

      assert_schema_conform
    end

    def ignored?(path)
      Rails.application.config.schema_conformist.ignored_api_paths.any? { |regex| path =~ regex }
    end
  end
end
