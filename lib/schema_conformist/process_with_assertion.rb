module SchemaConformist
  module ProcessWithAssertion
    include SchemaConformist::Driver

    def process(method, path, **kwargs)
      super

      return if schema_conformist_ignored_path?(path)

      assert_schema_conform
    end

    private

    def schema_conformist_ignored_path?(path)
      schema_conformist_ignored_api_paths.any? do |pattern|
        case pattern
        when String
          path.start_with?(pattern)
        when Regexp
          path.match?(pattern)
        end
      end
    end

    def schema_conformist_ignored_api_paths
      Rails.application.config.schema_conformist.ignored_api_paths
    end
  end
end
