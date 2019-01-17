module SpecTracker
  module TestReportParser
    class BaseParser
      def initialize
        # Should initialize a test_result_mapper ivar
        raise Error.new('override me!')
      end

      def parse(report_folder_path)
        validate_path!(report_folder_path)
        test_results = []
        report_directory(report_folder_path).each_entry do |entry|
          next unless entry.extname == report_file_extension
          xml_report = File.open(report_file(report_folder_path, entry)) {|f| Nokogiri::XML(f)}
          test_cases(xml_report).each {|test_case| test_results << test_result_mapper.map(test_case)}
        end
        test_results
      end

      protected

      attr_reader :test_result_mapper

      def report_file_extension
        raise Error.new('override me!')
      end

      def test_cases(_)
        raise Error.new('override me!')
      end

      private

      def report_directory(report_folder_path)
        SpecTracker.configuration.local_path.join(report_folder_path)
      end

      def report_file(report_folder_path, entry)
        report_directory(report_folder_path) + entry.basename
      end

      def validate_path!(report_folder_path)
        raise Error.new(%q{cannot find report folder}) unless File.directory? report_folder_path
        has_reports = Pathname.new(report_folder_path).entries.map(&:extname).any? report_file_extension
        raise Error.new(%q{no junit report to parse}) unless has_reports
      end
    end
  end
end
