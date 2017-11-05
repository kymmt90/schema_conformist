# SchemaConformist

SchemaConformist is an automatic JSON response validator for your API in Rails.

This library automatically validates that JSON responses are conformant with the schema. The schema can be described as either [JSON Hyper Schema](http://json-schema.org/latest/json-schema-hypermedia.html) or [OpenAPI 2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md).

This library uses [Committee](https://github.com/interagent/committee) and [Committee::Rails](https://github.com/willnet/committee-rails) to validate JSONs.

## Usage

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'schema_conformist'
```

and execute `bundle install`.

That's all. Then all JSON responses in integration-test/request-spec are validated according to your schema.

### Writing the Schema

Write your API schema in either JSON Hyper Schema or OpenAPI 2. For now, the default driver is set to JSON Hyper Schema and default schema paths are following:

- JSON Hyper Schema: `public/schema.json`
- OpenAPI 2: `public/swagger.json`

See [`test/dummy`](https://github.com/kymmt90/schema_conformist/tree/master/test/dummy) app for examples.

### Configurations

Configuration options are following:

- `schema_conformist.driver`
  - `:hyper_schema`: Use JSON Hyper Schema as schema format
  - `:open_api_2`: Use OpenAPI 2 as schema format
- `schema_conformist.ignored_api_paths`
  - The array of API paths not to validate. Each path can be described in regular expression.
- `schema_conformist.schema_path`
  - The path where the schema is placed

Example:

```ruby
Rails.application.config.schema_conformist.driver = :open_api_2
Rails.application.config.schema_conformist.ignored_api_paths << /private/
Rails.application.config.schema_conformist.schema_path = Rails.root.join('doc', 'swagger.json')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kymmt90/schema_conformist.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
