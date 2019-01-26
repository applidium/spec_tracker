require 'test_helper'

module SpecTracker
  module TestReportParser
    module JUnit
      class MapperTest < Minitest::Test
        def setup
          SpecTracker.configure do |configuration|
            configuration.scenario_name_header = 'Name/Rule'
            configuration.scenario_id_regex = '#((\d\.?)*\d)'
          end
          @mapper = Mapper.new
        end

        def test_return_success_result_from_success_testcase
          success_case = %Q{
            <testcase name="test_#0001" assertions="6" time="0.002139999996870756"></testcase>
          }
          testcase = Nokogiri::XML(success_case).children.first
          test_result = @mapper.map(testcase)
          assert_equal '0001', test_result.scenario_id
          assert test_result.status.success?
        end

        def test_return_failed_result_from_failure_testcase
          failed_case = %Q{
            <testcase name="test_#0001" time="0.002139999996870756"><failure message="should fail"></failure></testcase>
          }
          testcase = Nokogiri::XML(failed_case).children.first
          test_result = @mapper.map(testcase)
          assert test_result.status.failure?
        end

        def test_return_skipped_result_from_skipped_testcase
          skipped_case = %Q{
            <testcase name="test_#0001" time="0.002139999996870756"><skipped /></testcase>
          }
          testcase = Nokogiri::XML(skipped_case).children.first
          test_result = @mapper.map(testcase)
          assert test_result.status.skipped?
        end
      end
    end
  end
end
