require 'csv'
require 'yaml'
require 'Pathname'
require 'byebug'
require 'nokogiri'
require 'terminal-table'
require 'gemoji'

require 'spec_tracker/version'
require 'spec_tracker/config/configuration'
require 'spec_tracker/test_status'

require 'spec_tracker/spec_parser/scenario'
require 'spec_tracker/spec_parser/specification'
require 'spec_tracker/spec_parser/base_parser'
require 'spec_tracker/spec_parser/csv_parser'

require 'spec_tracker/test_report_parser/test_result'
require 'spec_tracker/test_report_parser/base_mapper'
require 'spec_tracker/test_report_parser/base_parser'
require 'spec_tracker/test_report_parser/j_unit/mapper'
require 'spec_tracker/test_report_parser/j_unit/parser'

require 'spec_tracker/reporter/status_ui'
require 'spec_tracker/reporter/base_ui_mapper'
require 'spec_tracker/reporter/base_reporter'
require 'spec_tracker/reporter/terminal/ui_mapper'
require 'spec_tracker/reporter/terminal/reporter'

require 'spec_tracker/reporter/report_datum'
require 'spec_tracker/reporter/report'
require 'spec_tracker/reporter/report_mapper'

require 'spec_tracker/report_task'

module SpecTracker
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
