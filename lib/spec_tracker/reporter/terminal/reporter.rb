module SpecTracker
  module Reporter
    module Terminal
      class Reporter < BaseReporter
        def initialize
          @ui_mapper = UIMapper.new
        end

        def print(report)
          terminal_table = ::Terminal::Table.new do |t|
            t.title = report.topic
            t.headings = [
              SpecTracker.configuration.wording[:scenario_id],
              SpecTracker.configuration.wording[:scenario_name],
              SpecTracker.configuration.wording[:test_result]
            ]
            t.rows = ui_mapper.map(report)
            t.add_separator
            t.add_row [SpecTracker.configuration.wording[:progression], nil, displayable_progression(report)]
          end
          terminal_table.align_column(2, :center)
          terminal_table.align_column(0, :left)
          puts terminal_table
        end
      end
    end
  end
end
