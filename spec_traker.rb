require 'Pathname'
require 'csv'
require 'nokogiri'
require 'byebug'
require 'terminal-table'
require 'gemoji'
require 'yaml'

=begin
IMPROVEMENT IDEAS
  - choose export mode : tests without matching scenario or scenario without matching test
  - Handle multiple spec files
  - Use google spreadsheets as spec file (with one or more sheets)
=end

############################################################################################################
#                                         Localisation                                                     #
############################################################################################################
wording = YAML.load_file('en.yml')
MISSING_SPECS = wording.dig(:en, :missing_specs)
TOO_MANY_ARGUMENTS = wording.dig(:en, :missing_specs)
SCENARIO_ID = wording.dig(:en, :scenario_id)
SCENARIO_NAME = wording.dig(:en, :scenario_name)
TEST_RESULT = wording.dig(:en, :test_result)
OUTPUT_TITLE = wording.dig(:en, :output_title)
PROGRESSION = wording.dig(:en, :progression)
BAD_FORMAT = wording.dig(:en, :bad_format)


############################################################################################################
#                                         Configuration                                                    #
############################################################################################################
config = YAML.load_file('config.yml')
SCENARIO_ID_SPEC_HEADER = config.dig(:config, :scenario_id_spec_header)
SCENARIO_NAME_SPEC_HEADER = config.dig(:config, :scenario_name_spec_header)
DEFAULT_PATH_TO_TEST_REPORTS = Pathname.pwd.join('test', 'reports')
PASS_STATUS_EMOJI = Emoji.find_by_alias("white_check_mark").raw.freeze
FAIL_STATUS_EMOJI = Emoji.find_by_alias("x").raw.freeze


############################################################################################################
#                                         Utils                                                            #
############################################################################################################
def testcase_status(testcase)
  testcase.xpath('child::*').empty? ? PASS_STATUS_EMOJI : FAIL_STATUS_EMOJI
end


############################################################################################################
#                                         SCRIPT                                                           #
############################################################################################################

# Check input before starting
inputs = ARGV
abort(MISSING_SPECS) if inputs.length.zero?
abort(TOO_MANY_ARGUMENTS) if inputs.length > 2

# Get scenario list
path_to_specs = Pathname.new(inputs.first)
scenario_list = []
CSV.foreach(path_to_specs, headers: true, skip_blanks: true) do |row|
  next if row[SCENARIO_ID_SPEC_HEADER].nil?
  scenario_list << { scenario_id: row[SCENARIO_ID_SPEC_HEADER], scenario_name: row[SCENARIO_NAME_SPEC_HEADER] }
end
puts scenario_list

# Process test report - Iterate over files
test_results = []
path_to_test_reports = (inputs.length == 2) ? Pathname.new(inputs.last) : DEFAULT_PATH_TO_TEST_REPORTS
path_to_test_reports.each_entry do |entry|
  next unless entry.extname == '.xml'
  xml_report = File.open(path_to_test_reports + entry.basename) { |f| Nokogiri::XML(f) }
  test_cases = xml_report.xpath('//testcase')
  test_cases.each do |testcase|
    name = testcase['name']
    scenario_id = name.slice(/#((\d\.?)*\d)/, 1)
    status = testcase_status(testcase)
    test_results << { scenario_id: scenario_id, test_status: status }
  end
end

total_matching_test_cases = 0
matrix_rows = scenario_list.map do |scenario|
  matching_testcase = test_results.detect { |test_result| test_result[:scenario_id] == scenario[:scenario_id] }
  total_matching_test_cases += 1 if matching_testcase
  test_status = matching_testcase&.dig(:test_status) || FAIL_STATUS_EMOJI
  [scenario[:scenario_id], scenario[:scenario_name], test_status]
end

progression = (total_matching_test_cases.to_f / scenario_list.length.to_f*100).round

terminal_table = Terminal::Table.new do |t|
  t.title = OUTPUT_TITLE
  t.headings = [SCENARIO_ID, SCENARIO_NAME, TEST_RESULT]
  t.rows = matrix_rows
  t.add_separator
  t.add_row [PROGRESSION, nil, "#{progression}%"]
end
terminal_table.align_column(2, :center)
terminal_table.align_column(0, :center)
puts terminal_table
