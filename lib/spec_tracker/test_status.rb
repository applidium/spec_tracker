module SpecTracker
  class TestStatus
    def initialize
      @status = nil
    end

    def success!
      @status = SUCCESS
    end

    def success?
      @status == SUCCESS
    end

    def failure!
      @status = FAILURE
    end

    def failure?
      @status == FAILURE
    end

    def skipped!
      @status = SKIPPED
    end

    def skipped?
      @status == SKIPPED
    end

    def missing!
      @status = MISSING
    end

    def missing?
      @status == MISSING
    end

    private

    SUCCESS = 0.freeze
    FAILURE = 1.freeze
    SKIPPED = 2.freeze
    MISSING = 3.freeze
  end
end