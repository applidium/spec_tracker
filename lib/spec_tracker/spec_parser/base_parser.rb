module SpecTracker
  module SpecParser
    class BaseParser
      def parse(path)
        specifications = []
        if spec_path(path).directory?
          spec_path(path).each_entry do |entry|
            next unless entry.extname == spec_file_extension
            scenarios = parse_single(spec_path(path).join(entry.basename))
            specifications << Specification.new(topic: entry.basename, scenarios: scenarios)
          end
        else
          scenarios = parse_single(spec_path(path))
          specifications << Specification.new(topic: spec_path(path).basename, scenarios: scenarios)
        end
        specifications
      end

      protected

      def spec_file_extension
        raise Error.new('override me!')
      end

      def parse_single(spec_file)
        raise Error.new('override me!')
      end

      private

      def spec_path(path)
        SpecTracker.configuration.local_path.join(path)
      end
    end
  end
end