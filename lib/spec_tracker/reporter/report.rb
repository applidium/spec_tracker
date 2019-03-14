module SpecTracker
  module Reporter
    class Report
      attr_reader :data, :topic

      def initialize(data:, topic:)
        @data = data
        @topic = topic
      end

      def progression
        return unless data.size.positive?
        success_count = data.select {|report_datum| report_datum.status.success?}.size
        (success_count.to_f / data.size.to_f * 100).round(1)
      end
    end
  end
end