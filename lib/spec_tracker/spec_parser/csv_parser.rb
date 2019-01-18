module SpecTracker
  module SpecParser
    class CSVParser < BaseParser
      private

      def spec_file_extension
        '.csv'
      end

      def parse_single(csv_file)
        scenarios = []
        CSV.foreach(csv_file, headers: true, skip_blanks: true) do |row|
          next if row[scenario_id_header].nil?
          scenario = Scenario.new(id: row[scenario_id_header], name: row[scenario_name_header])
          scenarios << scenario
        end
        scenarios
      end
    end
  end
end