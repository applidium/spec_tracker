module SpecTracker
  module Reporter
    class ReportMapper
      def map(scenarios:, test_results:, topic:)
        report_data = scenarios.map do |scenario|
          test_result = test_results.detect {|test_result| test_result.scenario_id == scenario.id}
          if test_result
            test_status = test_result.status
          else
            test_status = TestStatus.new
            test_status.missing!
          end
          ReportDatum.new(scenario_id: scenario.id, scenario_name: scenario.name, status: test_status)
        end
        Report.new(data: report_data, topic: topic)
      end
    end
  end
end