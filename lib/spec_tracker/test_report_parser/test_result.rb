module SpecTracker
  module TestReportParser
    class TestResult
      attr_reader :scenario_id, :status

      def initialize(scenario_id:, status:)
        @scenario_id = scenario_id
        @status = status
      end
    end
  end
end