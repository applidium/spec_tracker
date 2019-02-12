module SpecTracker
  class Configuration
    attr_accessor :scenario_id_header, :scenario_name_header, :locale,
                  :test_report_path, :spec_path, :scenario_id_regex, :spec_type

    attr_reader :wording, :local_path

    def initialize
      @scenario_id_header = 'Scenario ID'
      @scenario_name_header = 'Name/Rule'
      @spec_path = 'specifications'
      @test_report_path = 'test/reports'
      @scenario_id_regex = /\[([a-zA-Z\-]+)\]/
      @spec_type = 'csv'
      @available_types = %w(csv gherkin)
      @locale = 'fr'
      @available_locales = %w(fr en)
      wording_path = Pathname.new(__FILE__).join("../#{locale}.yml")
      @wording = YAML.load_file(wording_path)[:"#{locale}"]
      @local_path = Pathname.new(Dir.pwd)
    end
  end
end
