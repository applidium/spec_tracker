module SpecTracker
  module TestReportParser
    module JUnit
      class Parser < BaseParser
        def initialize
          @test_result_mapper = Mapper.new
        end

        private

        attr_reader :test_result_mapper

        def parse_single(file)
          test_results = []
          return test_results unless valid_extension?(file)
          xml_report = File.open(file) {|f| Nokogiri::XML(f)}
          test_cases(xml_report).each {|test_case| test_results << test_result_mapper.map(test_case)}
          test_results
        end

        def file_extension
          '.xml'.freeze
        end

        def test_cases(xml_report)
          xml_report.xpath('//testcase')
        end
      end
    end
  end
end