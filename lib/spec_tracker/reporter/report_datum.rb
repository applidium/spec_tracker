module SpecTracker
  module Reporter
    class ReportDatum
      attr_reader :scenario_id, :scenario_name, :status

      def initialize(scenario_id:, scenario_name:, status:)
        @scenario_id = scenario_id
        @scenario_name = scenario_name
        @status = status
      end
    end
  end
end