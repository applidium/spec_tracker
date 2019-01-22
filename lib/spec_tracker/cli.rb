module SpecTracker
  class CLI < Thor
      desc 'report', 'generate a report for a given configuration (default or custom)'
      method_option :spec_path, type: :string, desc: "Path to the specifications. Expects a relative path to a file or a directory. Default: specifications"
      method_option :test_report_path, type: :string, desc: "Path to the test reports. Expects a relative path to a file or a directory. Default: test/reports"
      method_option :scenario_id_regex, type: :string, desc: "Regexp to find scenario ID in test reports. Default : #((\\d\\.?)*\\d)"
      method_option :scenario_id_header, type: :string, desc: "Name of the scenario ID column when spec files are csv. Default: #Scenario"
      method_option :scenario_name_header, type: :string, desc: "Name of the scenario name column when spec files are csv. Default: Name/Rule"
      method_option :locale, enum: %w(fr en), desc: "Locale for text output. Default: fr"
      def report
        SpecTracker.configure do |configuration|
          configuration.spec_path = options[:spec_path] if options[:spec_path]
          configuration.test_report_path = options[:test_report_path] if options[:test_report_path]
          configuration.scenario_id_header = options[:scenario_id_header] if options[:scenario_id_header]
          configuration.scenario_name_header = options[:scenario_name_header] if options[:scenario_name_header]
          configuration.locale = options[:locale] if options[:locale]
          configuration.scenario_id_regex = options[:scenario_id_regex] if options[:scenario_id_regex]
        end
        SpecTracker::ReportTask.new.execute
      end
  end
end