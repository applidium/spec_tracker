module SpecTracker
  module SpecParser
    class Scenario
      attr_reader :id, :name

      def initialize(id:, name:)
        @id = id
        @name = name
      end
    end
  end
end