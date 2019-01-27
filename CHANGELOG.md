# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2019-01-27
### Added
- dev dependency to active support to write rails-like test
- base class for test that extends the active support extension that defines test(name, &block)
- CSV specifications for project

### Changed
- test syntax
- default header for scenario IDs is now Scenario ID
- default regexp ID must now be a ruby regex

## [1.0.0] - 2019-01-25
### Added
- Support multiple CSV specification files
- Support single JUnit report file
- Configuration parameters
- CLI with report command including options
- tests for CSV parser, JUnit mapper and spec_tracker
- minitest-reporters test dependency
- CHANGELOG


### Changed
- Output title is the name of the corresponding CSV specification file
- Compatibility with Ruby ~> 2.3
- Usage instructions in README


### Removed
- YAML configuration
- spec tracker script