module SpecTracker
  module StatusUI
    SUCCESS_EMOJI = Emoji.find_by_alias("white_check_mark").raw.freeze
    FAILURE_EMOJI = Emoji.find_by_alias("x").raw.freeze
    SKIPPED_EMOJI = Emoji.find_by_alias("fast_forward").raw.freeze
    MISSING_EMOJI = Emoji.find_by_alias("no_mouth").raw.freeze
  end
end