module SpecTracker
  module SpecParser
    class Specification
      attr_reader :topic, :scenarios

      def initialize(topic:, scenarios:)
        @topic = topic
        @scenarios = scenarios
      end
    end
  end
end