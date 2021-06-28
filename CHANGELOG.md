# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 0.5.0 - 2021-06-28
### Changed

- [Drop Ruby 2.4.x which has support ended and add 3.0.x](https://github.com/kymmt90/schema_conformist/pull/22)
  - Drop Ruby 2.4.x and add Ruby 3.0.x in CI
- [Bump committee to 4.4.0](https://github.com/kymmt90/schema_conformist/pull/21)
  - This change requires Committee 4.4.0
  - Set Committee's option `query_hash_key` to 'committee.query_hash'

## 0.4.0 - 2020-06-30

### Changed

- [Bump committee to 4.0.0](https://github.com/kymmt90/schema_conformist/pull/18)
  - This change requires Committee 4.0.0

## 0.3.0 - 2019-04-22

### Added

- [Support OpenAPI 3](https://github.com/kymmt90/schema_conformist/pull/15)

## 0.2.2 - 2019-03-27

### Fixed

- [Fix to work correctly against current dependencies](https://github.com/kymmt90/schema_conformist/pull/11)

## 0.2.1 - 2018-02-01

### Changed

- [Use Travis CI](https://github.com/kymmt90/schema_conformist/pull/8)

### Fixed

- [Relax dependency constraints](https://github.com/kymmt90/schema_conformist/pull/7)

## 0.2.0 - 2017-12-14

### Added

- [Set up CI](https://github.com/kymmt90/schema_conformist/pull/2)
- [Add build badges to README](https://github.com/kymmt90/schema_conformist/pull/3)
- [Enable to use YAML format schema](https://github.com/kymmt90/schema_conformist/pull/5) by [@tzmfreedom](https://github.com/tzmfreedom)

### Fixed

- [Fix dummy app tests](https://github.com/kymmt90/schema_conformist/pull/4)

## 0.1.1 - 2017-11-06

### Added

- [Initialize configurations in `before_configuration` block](https://github.com/kymmt90/schema_conformist/pull/1)

## 0.1.0 - 2017-11-05

### Added

- Validate that JSON responses are conformant with OpenAPI2/JSON Hyper Schema
- Describe Usage in README
