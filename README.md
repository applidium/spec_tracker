# spec_tracker
Track tests that validate specification use cases

## Dependencies

This script is tested with `ruby >= 2.3.0`.

You will need to install `terminal-table`, `gemoji` and `nokogiri` before using this script
```
$ gem install terminal-table gemoji nokogiri
```

## Usage

### Specification file
#### General syntax rules
This script uses *JUnit* generated reports.
To link a scenario with a test you should put ``#<scenario-id>`` in the test name.

### Command Line

```
$ ruby spec_tracker.rb <path-to-spec-file> <path-to-reports-folder>
```


## Output

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

## Improvement ideas
  - choose export mode : tests without matching scenario or scenario without matching test
  - Handle multiple spec files
  - Use google spreadsheets as spec file (with one or more sheets)
  - better opts handling
