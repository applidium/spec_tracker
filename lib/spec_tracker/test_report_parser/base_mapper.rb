module SpecTracker
  module TestReportParser
    class BaseMapper
      def map(test_case)
        name = get_scenario_name(test_case)
        scenario_id = get_scenario_id(name)
        status = get_scenario_status(test_case)
        TestResult.new(scenario_id: scenario_id, status: status)
      end

      protected

      def get_scenario_name(_)
        raise Error.new('override me!')
      end

      def failed?(_)
        raise Error.new('override me!')
      end

      def success?(_)
        raise Error.new('override me!')
      end

      def skipped?(_)
        raise Error.new('override me!')
      end

      private

      def get_scenario_id(scenario_name)
        scenario_name.slice(scenario_id_regex, 1)
      end

      def scenario_id_regex
        Regexp.new(SpecTracker.configuration.scenario_id_regex)
      end

      def get_scenario_status(testcase)
        test_status = TestStatus.new
        if success?(testcase)
          test_status.success!
        elsif skipped?(testcase)
          test_status.skipped!
        else
          test_status.failure!
        end
        test_status
      end
    end
  end
end