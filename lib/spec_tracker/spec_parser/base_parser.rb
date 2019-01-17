module SpecTracker
  module SpecParser
    class BaseParser
      def parse(spec_file: , scenario_id_header:, scenario_name_header:)
        raise Error.new('override me!')
      end
    end
  end
end