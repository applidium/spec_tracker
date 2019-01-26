module SpecTracker
  class Configuration
    attr_accessor :scenario_id_header, :scenario_name_header, :locale,
                  :test_report_path, :spec_path, :scenario_id_regex

    attr_reader :wording, :local_path

    def initialize
      @scenario_id_header = 'Scenario ID'
      @scenario_name_header = 'Name/Rule'
      @locale = 'fr'
      @spec_path = 'specifications'
      @test_report_path = 'test/reports'
      @available_locales = %w(fr en)
      wording_path = Pathname.new(__FILE__).join("../#{locale}.yml")
      @wording = YAML.load_file(wording_path)[:"#{locale}"]
      @local_path = Pathname.new(Dir.pwd)
      @scenario_id_regex = /\[([a-zA-Z\-]+)\]/
    end
  end
end
