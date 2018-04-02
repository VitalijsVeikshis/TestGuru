module TestsHelper
  class RangedHash
    def initialize(hash)
      @ranges = hash
    end

    def [](key)
      @ranges.each do |range, value|
        return value if range.include?(key)
      end
      nil
    end
  end

  TEST_LEVELS = RangedHash.new(0..1 => :easy, 2..4 => :normal).freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hard
  end

  def test_header(test)
    if test.new_record?
      'Create New Test'
    else
      "Edit #{test.title} Test"
    end
  end
end
