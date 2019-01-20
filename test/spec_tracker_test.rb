require "test_helper"

class SpecTrackerTest < Minitest::Test
  def teardown
    SpecTracker.configuration = nil
  end

  def test_that_it_has_a_version_number
    refute_nil ::SpecTracker::VERSION
  end

  def test_should_apply_default_configuration
    SpecTracker.configure { |_| }
    assert_equal '#Scenario', SpecTracker.configuration.scenario_id_header
    assert_equal 'Name/Rule', SpecTracker.configuration.scenario_name_header
    assert_equal 'fr', SpecTracker.configuration.locale
    assert_equal '../../Sources/46_Access_Control_GW/test/reports/', SpecTracker.configuration.test_report_path
    assert_equal './specifications/Access_Control_Syncrospec2018 - [SPECTEST] Access_Control.csv', SpecTracker.configuration.spec_path
    assert_equal '#((\d\.?)*\d)', SpecTracker.configuration.scenario_id_regex
  end

  def test_should_apply_local_configuration
    SpecTracker.configure do |configuration|
      configuration.scenario_id_header = 'custom-id-header'
      configuration.scenario_name_header = 'custom-name-header'
      configuration.locale = 'custom-locale'
      configuration.test_report_path = 'custom-test-report-path'
      configuration.spec_path = 'custom-spec-path'
      configuration.scenario_id_regex = 'custom-id-regex'
    end
    assert_equal 'custom-id-header', SpecTracker.configuration.scenario_id_header
    assert_equal 'custom-name-header', SpecTracker.configuration.scenario_name_header
    assert_equal 'custom-locale', SpecTracker.configuration.locale
    assert_equal 'custom-test-report-path', SpecTracker.configuration.test_report_path
    assert_equal 'custom-spec-path', SpecTracker.configuration.spec_path
    assert_equal 'custom-id-regex', SpecTracker.configuration.scenario_id_regex
  end
end
