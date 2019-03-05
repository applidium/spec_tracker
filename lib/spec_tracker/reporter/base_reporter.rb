module SpecTracker
  module Reporter
    class BaseReporter
      def initialize
        # Should initialize UIMapper
        raise Error.new('override me!')
      end

      def print(_)
        raise Error.new('override me!')
      end

      protected

      def displayable_progression(report)
        "#{report.progression}%" if report.progression
      end

      attr_reader :ui_mapper
    end
  end
end