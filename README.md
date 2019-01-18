# SpecTracker

Simple visualization of specification use cases with the corresponding test status (fail or pass).
Prompts a traceability matrix from JUnit generated reports and a csv describing scenarios.

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

TODO: Write usage instructions here
This script is tested with `ruby >= 2.3.0`.
To link a scenario with a test, put ``#<scenario-id>`` in the test name.

Eg:
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/spec_tracker.
