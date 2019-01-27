require 'test_helper'

module SpecTracker
  module TestReportParser
    module JUnit
      class MapperTest < BaseTest
        def setup
          SpecTracker.configure do |configuration|
            configuration.scenario_name_header = 'Name/Rule'
            configuration.scenario_id_regex = /#((\d\.?)*\d)/
          end
          @mapper = Mapper.new
        end

        test 'return_success_result_from_success_testcase' do
          success_case = %Q{
            <testcase name="test_#0001" assertions="6" time="0.002139999996870756"></testcase>
          }
          testcase = Nokogiri::XML(success_case).children.first
          test_result = @mapper.map(testcase)
          assert_equal '0001', test_result.scenario_id
          assert test_result.status.success?
        end

        test 'return_failed_result_from_failure_testcase' do
          failed_case = %Q{
            <testcase name="test_#0001" time="0.002139999996870756"><failure message="should fail"></failure></testcase>
          }
          testcase = Nokogiri::XML(failed_case).children.first
          test_result = @mapper.map(testcase)
          assert test_result.status.failure?
        end

        test 'return_skipped_result_from_skipped_testcase' do
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
