$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "spec_tracker"
require 'byebug'
require 'active_support/testing/declarative'

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new, Minitest::Reporters::JUnitReporter.new]

class BaseTest < Minitest::Test
  extend ActiveSupport::Testing::Declarative
end