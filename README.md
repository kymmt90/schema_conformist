# SchemaConformist

[![Gem Version](https://badge.fury.io/rb/schema_conformist.svg)](https://badge.fury.io/rb/schema_conformist) [![Build Status](https://github.com/kymmt90/schema_conformist/workflows/build/badge.svg)](https://github.com/kymmt90/schema_conformist/actions?workflow=build)

> An automatic JSON request/response validator for testing in Rails

SchemaConformist is an automatic JSON request/response validator for your API testing in Rails.

This library automatically validates that JSON requests/responses are conformant with the schema. The schema can be described as one of [JSON Hyper Schema](http://json-schema.org/latest/json-schema-hypermedia.html), [OpenAPI 2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md) and OpenAPI 3 (currently [3.0.2](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.2.md) is latest).

This library uses [Committee](https://github.com/interagent/committee) to validate JSONs.

## Usage

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'schema_conformist'
```

and execute `bundle install`.

Configure `schema_path` as follows (ex. using an OpenAPI 3 schema):

```ruby
Rails.application.config.schema_conformist.schema_path = Rails.root.join('doc', 'openapi.yaml')
```

That's all. Then all JSON requests/responses in integration-test/request-spec are validated according to your schema.

### Writing the Schema

Write your API schema in one of JSON Hyper Schema, OpenAPI 2 and OpenAPI 3.

See [`test/dummy`](https://github.com/kymmt90/schema_conformist/tree/master/test/dummy) app for examples.

### Configurations

Configuration options are following:

- `schema_conformist.schema_path`
  - Required. The path where the schema is placed
- `schema_conformist.ignored_api_paths`
  - Optional. The array of API paths not to validate. Each path can be described in String literal (used for prefix search) or regular expression.
- `schema_conformist.committee.old_assert_behavior`
  - Optional. Set `true` if you want to skip validating request parameters. The default value is `false`.
  - cf. ["Test Assertions" in Committee README](https://github.com/interagent/committee#test-assertions)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kymmt90/schema_conformist.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
