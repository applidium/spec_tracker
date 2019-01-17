module SpecTracker
  module Reporter
    module Terminal
      class UIMapper < BaseUIMapper
        def map(report)
          report.data.map do |report_datum|
            [report_datum.scenario_id, report_datum.scenario_name, status_to_ui(report_datum.status)]
          end
        end
      end
    end
  end
end