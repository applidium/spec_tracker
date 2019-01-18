module SpecTracker
  module TestReportParser
    module JUnit
      class JUnitMapper < BaseMapper
        private

        def get_scenario_name(test_case)
          test_case['name']
        end

        def failed?(testcase)
          !success?(testcase) && !skipped?(testcase)
        end

        def success?(testcase)
          testcase.xpath('child::*').empty?
        end

        def skipped?(testcase)
          testcase.xpath('child::skipped').any?
        end
      end
    end
  end
end