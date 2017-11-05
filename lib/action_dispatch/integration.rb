module ActionDispatch
  module Integration
    class Session
      prepend SchemaConformist::ProcessWithAssertion
    end
  end
end
