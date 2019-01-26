module SpecTracker
  module Reporter
    class BaseUIMapper
      include StatusUI

      def map(_)
        raise Error.new('override me!')
      end

      protected

      def status_to_ui(status)
        if status.success?
          SUCCESS_EMOJI
        elsif status.failure?
          FAILURE_EMOJI
        elsif status.skipped?
          SKIPPED_EMOJI
        elsif status.missing?
          MISSING_EMOJI
        end
      end
    end
  end
end