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
      ignored_api_paths.any? do |pattern|
        case pattern
        when String
          path.start_with?(pattern)
        when Regexp
          path.match?(pattern)
        end
      end
    end

    def ignored_api_paths
      Rails.application.config.schema_conformist.ignored_api_paths
    end
  end
end
