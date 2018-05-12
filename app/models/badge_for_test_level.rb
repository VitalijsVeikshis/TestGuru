class BadgeForTestLevel < Badge
  store_accessor :params, :level

  def pass?(user)
    tests_by_level = Test.where(level: level.to_i).pluck(:title)

    tests_by_level.all? do |test|
      user.tests_by_pass_and_level(true, level.to_i)
          .pluck(:title)
          .include?(test)
    end
  end
end
