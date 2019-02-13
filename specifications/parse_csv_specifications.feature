Feature: Parse CSV specifications

  Scenario: [single-csv-file] Get scenarios from a single specification file
    Given: the configuration indicates a path to a csv file with a header matching the configuration
    When parsing the file
    Then return the scenarios matching the regexp from the file

  Scenario: [multiple-csv-files] Get scenarios from multiple specification files
    Given the configuration indicates a path to folder containing multiple a csv files with a header matching the configuration
    When parsing the files
    Then return the scenarios matching the regexp from all the files