module SpecTracker
  class CLI < Thor
      desc 'report [SPEC_PATH] [TEST_REPORT_PATH]', 'generate a report from a relative path to specifications (file or directory) and a relative path to test report(s) (file or directory)'
      method_option :scenario_id_regex, type: :string, desc: "Regexp to find scenario ID in test reports. Default : #((\\d\\.?)*\\d)", required: false
      method_option :scenario_id_header, type: :string, desc: "Name of the scenario ID column when spec files are csv. Default: #Scenario"
      method_option :scenario_name_header, type: :string, desc: "Name of the scenario name column when spec files are csv. Default: Name/Rule"
      method_option :locale, enum: %w(fr en), desc: "Locale for text output. Default: fr"
      def report(spec_path, test_report_path)
        SpecTracker.configure do |configuration|
          configuration.spec_path = spec_path
          configuration.test_report_path = test_report_path
          configuration.scenario_id_header = option[:scenario_id_header] if options[:scenario_id_header]
          configuration.scenario_name_header = option[:scenario_name_header] if options[:scenario_name_header]
          configuration.locale = option[:locale] if options[:locale]
          configuration.scenario_id_regex = option[:scenario_id_regex] if options[:scenario_id_regex]
        end
        SpecTracker::ReportTask.new.execute
      end
  end
end