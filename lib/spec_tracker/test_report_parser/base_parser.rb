module SpecTracker
  module TestReportParser
    class BaseParser
      def parse(path)
        test_results = []
        if report_path(path).directory?
          report_path(path).each_entry do |entry|
            results = parse_single(report_path(path).join(entry.basename))
            test_results.concat(results) unless results.empty?
          end
        else
          results = parse_single(report_path(path))
          test_results.concat(results) unless results.empty?
        end
        test_results
      end

      protected

      def parse_single(file)
        raise Error.new('override me!')
      end

      def file_extension
        raise Error.new('override me!')
      end

      def test_cases(_)
        raise Error.new('override me!')
      end

      def valid_extension?(entry)
        entry.extname == file_extension
      end

      private

      def report_path(path)
        SpecTracker.configuration.local_path.join(path)
      end
    end
  end
end
