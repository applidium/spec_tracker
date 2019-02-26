# SpecTracker

Parse CSV specifications, match them with JUnit reports and print the corresponding traceability matrix in the terminal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spec_tracker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spec_tracker

## Usage

### Configuration

| Parameter | Default value | Description |
| --------- | ----- | ------- |
| `spec_path` | 'specifications' | Path to the specification file(s). Expects a relative path to a file or a director |
| `spec_type` | 'csv' | Type of specification files. Available values : csv, gherkin |
| `scenario_id_header` | 'Scenario ID' | Header of the CSV column that contains the scenario names |
| `scenario_name_header` | 'Name/Rule' | Header of the CSV column that contains the scenario IDs |
| `scenario_id_regex` | `/\[([a-zA-Z\-]+)\]/` | Regexp to find scenario IDs in the test names. Default is kebab-case words |
| `test_report_path` | 'test/reports' | Path to the test reports. Expects a relative path to a file or a directory |
| `locale` | 'fr' | Locale for text output. Available values : fr, en |

### Test result symbols

| Symbol | Meaning |
| ---------: | ------- |
| ✅ | There is a test for this scenario and it PASSES |
| 😶 | No tests were found for this scenario |
| ❌ | There is a test for this scenario and if FAILS |
| ⏩ | There is a SKIPPED test for this scenario |

### CLI

    
    $ spec_tracker report
    +---------------------------+-------------------------------------+----------------+
    |                            some_specification_file.csv          |                |
    +---------------------------+-------------------------------------+----------------+
    | Identifiant du scénario   | Nom du scénario                     | Statut du test |
    +---------------------------+-------------------------------------+----------------+
    |    sign-up                | [MyProject] Scenario 4.1.1          |     ✅         |
    |    login                  | [MyProject] Scenario 4.2.1          |     ✅         |
    |    logout                 | [MyProject] Scenario 4.3.1          |     😶         |
    |    delete-account         | [MyProject] Scenario 5.1.1          |     ❌         |
    |    news-feed              | [MyProject] Scenario 5.1.2          |     ✅         |
    |    like-news              | [MyProject] Scenario 5.1.3          |     ✅         |
    |    unlike-news            | [MyProject] Scenario 5.1.4          |     ❌         |
    |    topics                 | [MyProject] Scenario 5.1.5          |     😶         |
    |    subscribe-topic        | [MyProject] Scenario 5.1.6          |     😶         |
    |    unsubscribe-topic      | [MyProject] Scenario 6.1.1          |     😶         |
    |    account-information    | [MyProject] Scenario 6.1.2          |     😶         |
    |    reset-password         | [MyProject] Scenario 6.1.3          |     😶         |
    +---------------------------+-------------------------------------+----------------+
    |    Progression            |                                     |     33%        |
    +---------------------------+-------------------------------------+----------------+
    


Help to configure the report command :

    
    $ spec_tracker help report
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/applidium/spec_tracker.
