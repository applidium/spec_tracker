module SpecTracker
  module TestReportParser
    module JUnit
      class Parser < BaseParser
        def initialize
          @test_result_mapper = JUnitMapper.new
        end

        private

        def report_file_extension
          '.xml'.freeze
        end

        def test_cases(xml_report)
          xml_report.xpath('//testcase')
        end
      end
    end
  end
end