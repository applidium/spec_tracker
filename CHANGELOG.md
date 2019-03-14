# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.3] - 2019-02-13
### Changed
- Lower nokogiri requirement to 1.1
- Remove Gemfile.lock
- Update license in gemspec
- Left align Scenario IDs in report display
- Add the skipped test status, cli command for old projects and CLI parameters in README
- Fix progression computation when there is no scenarios
- remove some dead code

## [1.2.2] - 2019-02-13
### Changed
- Update license in gemspec

## [1.2.1] - 2019-02-13
### Changed
- Update repository link in contributing README section (use applidium repository)
- Update homepage in gemspec (use applidium repository)

## [1.2.0] - 2019-02-13
### Added
- dependency to cucumber
- Gherkin support for csv specifications
- Configuration parameter `spec_type` to select specification type. csv by default but gherkin is also accepted.

### Changed
- Moved scenario_id_header and scenario_name_header in csv specification parser
- License is now MIT instead of Apache 2.0
- Fix random fail in configuration tests

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