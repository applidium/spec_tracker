require "test_helper"

class SpecTrackerTest < BaseTest
  def setup
    SpecTracker.configuration = nil
  end

  test 'it has a version number' do
    refute_nil ::SpecTracker::VERSION
  end

  test '[default-configuration] should_apply_default_configuration' do
    SpecTracker.configure { |_| }
    assert_equal 'Scenario ID', SpecTracker.configuration.scenario_id_header
    assert_equal 'Name/Rule', SpecTracker.configuration.scenario_name_header
    assert_equal 'fr', SpecTracker.configuration.locale
    assert_equal 'test/reports', SpecTracker.configuration.test_report_path
    assert_equal 'specifications', SpecTracker.configuration.spec_path
    assert_equal /\[([a-zA-Z\-]+)\]/, SpecTracker.configuration.scenario_id_regex
  end

  test '[local-configuration] should_apply_local_configuration' do
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
