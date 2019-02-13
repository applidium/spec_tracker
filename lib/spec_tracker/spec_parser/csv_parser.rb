module SpecTracker
  module SpecParser
    class CSVParser < BaseParser
      private

      def spec_file_extension
        '.csv'
      end

      def parse_single(csv_file)
        scenarios = []
        scenario_id_header = SpecTracker.configuration.scenario_id_header
        scenario_name_header = SpecTracker.configuration.scenario_name_header
        CSV.foreach(csv_file, headers: true, skip_blanks: true) do |row|
          next if row[scenario_id_header].nil?
          scenario_id = row[scenario_id_header]
          scenario_name = row[scenario_name_header]
          scenarios << Scenario.new(id: scenario_id, name: scenario_name)
        end
        scenarios
      end
    end
  end
end