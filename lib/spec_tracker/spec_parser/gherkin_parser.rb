module SpecTracker
  module SpecParser
    class GherkinParser < BaseParser
      def initialize
        @language_parser = Gherkin::Parser.new
      end

      private

      def spec_file_extension
        '.feature'
      end

      # FIXME: handle large files
      def parse_single(spec_file)
        file_content = File.read(spec_file)
        parse_result = @language_parser.parse(file_content)
        parse_result[:feature][:children].select { |child| child[:type].downcase == :scenario }.map do |scenario|
          scenario_id = scenario[:name].slice(SpecTracker.configuration.scenario_id_regex, 1)
          next if scenario_id.nil?
          scenario_name = scenario[:name].gsub(SpecTracker.configuration.scenario_id_regex, '').strip
          Scenario.new(id: scenario_id, name: scenario_name)
        end
      end
    end
  end
end