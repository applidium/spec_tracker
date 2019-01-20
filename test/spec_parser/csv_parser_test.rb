require 'test_helper'

module SpecTracker
  module SpecParser
    class CSVParserTest < Minitest::Test
      def setup
        SpecTracker.configure do |configuration|
          configuration.scenario_id_header = '#Scenario'
          configuration.scenario_name_header = 'Name/Rule'
        end
      end

      def test_get_scenarios_from_one_file
        file = Pathname.new(__FILE__).join('../csv_files/single/specifications.csv')
        specifications = CSVParser.new.parse(file)
        assert_equal 1, specifications.size
        specification = specifications.first
        assert_equal 5, specification.scenarios.size
        expected_values = [
          {id: '0.1.1', name: 'Scenario 0.1.1'},
          {id: '0.1.2', name: 'Scenario 0.1.2'},
          {id: '0.2.1', name: 'Scenario 0.2.1'},
          {id: '0.3.1', name: 'Scenario 0.3.1'},
          {id: '0.3.2', name: 'Scenario 0.3.2'},
        ]
        specification.scenarios.each_with_index do |scenario, index|
          assert_equal expected_values[index][:id], scenario.id
          assert_equal expected_values[index][:name], scenario.name
        end
      end
    end
  end
end
