class BadgeForTestAttempt < Badge
  store_accessor :params, :attempts

  def pass?(user)
    pass_tests = user.tests_by_pass(true).pluck(:title)
    unpass_tests = user.tests_by_pass(false).pluck(:title)

    pass_tests.any? do |test|
      unpass_tests.count(test) < attempts.to_i
    end
  end
end
