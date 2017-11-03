module ActionDispatch
  module Integration
    class Session
      prepend SchemaConformist::AssertSchemaConformAvailable
    end
  end
end
