module SpecTracker
  class ReportTask
    attr_reader :spec_parser, :test_report_parser, :report_mapper, :reporter

    def initialize
      @spec_parser = SpecParser::CSVParser.new
      @test_report_parser = TestReportParser::JUnit::Parser.new
      @report_mapper = Reporter::ReportMapper.new
      @reporter = Reporter::Terminal::Reporter.new
    end

    def execute
      specifications = spec_parser.parse(SpecTracker.configuration.spec_path)
      test_results = test_report_parser.parse(SpecTracker.configuration.test_reports_path)
      specifications.map do |specification|
        report = report_mapper.map(
          topic: specification.topic,
          scenarios: specification.scenarios,
          test_results: test_results
        )
        reporter.print(report)
      end
    end
  end
end
