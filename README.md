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

| Parameter | Value | Usage |
| --------- | ----- | ------- |
| `spec_path` | 'specifications' | Path to the specification file(s). Expects a relative path to a file or a director |
| `test_report_path` | 'test/reports' | Path to the test reports. Expects a relative path to a file or a directory |
| `scenario_id_header` | '#Scenario' | Header of the CSV column that contains the scenario names |
| `scenario_name_header` | 'Name/Rule' | Header of the CSV column that contains the scenario IDs |
| `scenario_id_regex` | '#((\d\.?)*\d)' | Regexp to find scenario IDs in the test names |
| `locale` | 'fr' | Locale for text output |

    
    $ spec_tracker report
    


Output example:

```
+-------------+--------------------------------------------+-------------+
|                            Traceability Matrix                         |
+-------------+--------------------------------------------+-------------+
| Scenario ID | Scenario Name                              | Test Result |
+-------------+--------------------------------------------+-------------+
|    4.1.1    | [MyProject] Scenario name for 4.1.1        |     ❌      |
|    4.2.1    | [MyProject] Scenario name for 4.2.1        |     ❌      |
|    4.3.1    | [MyProject] Scenario name for 4.3.1        |     ❌      |
|    5.1.1    | [MyProject] Scenario name for 5.1.1        |     ✅      |
|    5.1.2    | [MyProject] Scenario name for 5.1.2        |     ❌      |
|    5.1.3    | [MyProject] Scenario name for 5.1.3        |     ❌      |
|    5.1.4    | [MyProject] Scenario name for 5.1.4        |     ❌      |
|    5.1.5    | [MyProject] Scenario name for 5.1.5        |     ❌      |
|    5.1.6    | [MyProject] Scenario name for 5.1.6        |     ❌      |
|    6.1.1    | [MyProject] Scenario name for 6.1.1        |     ✅      |
|    6.1.2    | [MyProject] Scenario name for 6.1.2        |     ✅      |
|    6.1.3    | [MyProject] Scenario name for 6.1.3        |     ✅      |
|    6.1.4    | [MyProject] Scenario name for 6.1.4        |     ✅      |
|    6.1.5    | [MyProject] Scenario name for 6.1.5        |     ✅      |
|    6.1.6    | [MyProject] Scenario name for 6.1.6        |     ✅      |
|    7.1.1    | [MyProject] Scenario name for 7.1.1        |     ✅      |
|    7.2.1    | [MyProject] Scenario name for 7.2.1        |     ✅      |
|    7.3.1    | [MyProject] Scenario name for 7.3.1        |     ❌      |
|    8.1.1    | [MyProject] Scenario name for 8.1.1        |     ❌      |
|    8.1.2    | [MyProject] Scenario name for 8.1.2        |     ❌      |
|    8.1.3    | [MyProject] Scenario name for 8.1.3        |     ❌      |
|    8.1.4    | [MyProject] Scenario name for 8.1.4        |     ❌      |
+-------------+--------------------------------------------+-------------+
| Progression |                                            |     41%     |
+-------------+--------------------------------------------+-------------+
```

Help to configure the report command :

    
    $ spec_tracker help report
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jvigne/spec_tracker.
