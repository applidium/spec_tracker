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

      def view_models(report_data)

      end

      private

      attr_reader :ui_mapper
    end
  end
end