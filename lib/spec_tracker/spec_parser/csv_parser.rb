module SpecTracker
  module SpecParser
    class CSVParser < BaseParser
      def parse(path)
        scenarios = []
        csv_file = SpecTracker.configuration.local_path.join(path)
        CSV.foreach(csv_file, headers: true, skip_blanks: true) do |row|
          next if row[SpecTracker.configuration.scenario_id_header].nil?
          scenario = Scenario.new(id: get_scenario_id(row), name: get_scenario_name(row))
          scenarios << scenario
        end
        scenarios
      end

      private

      def get_scenario_id(row)
        row[SpecTracker.configuration.scenario_id_header]
      end

      def get_scenario_name(row)
        row[SpecTracker.configuration.scenario_name_header]
      end
    end
  end
end