class BadgeForTestCategory < Badge
  store_accessor :params, :category

  def pass?(user)
    tests_by_category = Test.by_category_title(category).pluck(:title)

    tests_by_category.all? do |test|
      user.tests_by_pass_and_category(true, category)
          .pluck(:title)
          .include?(test)
    end
  end
end
