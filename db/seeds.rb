# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_password(char)
  Array.new(6, char).join('')
end

list_of_categories = Category.create!(
  [
    { title: 'Frontend' },
    { title: 'Backend' },
    { title: 'Machine Learning' }
  ]
)

list_of_users = User.create!(
  [
    { email: 'User5@m.com',
      password: get_password('1'),
      password_confirmation: get_password('1'),
      first_name: 'user5_name',
      last_name: 'user5_lastname' },
    { email: 'User2@m.com',
      password: get_password('2'),
      password_confirmation: get_password('2'),
      first_name: 'user2_name',
      last_name: 'user2_lastname' },
    { email: 'User3@m.com',
      password: get_password('3'),
      password_confirmation: get_password('3'),
      type: 'Admin',
      first_name: 'user3_name',
      last_name: 'user3_lastname' },
    { email: 'User4@m.com',
      password: get_password('4'),
      password_confirmation: get_password('4'),
      type: 'Admin',
      first_name: 'user4_name',
      last_name: 'user4_lastname' }
  ]
)

list_of_tests = Test.create!(
  [
    { title: 'Ruby',
      level: 1,
      category_id: list_of_categories[1].id,
      author_id: list_of_users[2].id },
    { title: 'JS',
      level: 0,
      category_id: list_of_categories[0].id,
      author_id: list_of_users[2].id },
    { title: 'Rails',
      level: 2,
      category_id: list_of_categories[1].id,
      author_id: list_of_users[2].id },
    { title: 'R',
      level: 5,
      category_id: list_of_categories[2].id,
      author_id: list_of_users[3].id },
    { title: 'Java',
      level: 3,
      category_id: list_of_categories[1].id,
      author_id: list_of_users[3].id }
  ]
)

list_of_questions = Question.create!(
  [
    { body: 'Ruby question 1?',
      test_id: list_of_tests[0].id },
    { body: 'Ruby question 2?',
      test_id: list_of_tests[0].id },
    { body: 'Ruby question 3?',
      test_id: list_of_tests[0].id },
    { body: 'Java question 1?',
      test_id: list_of_tests[4].id },
    { body: 'Java question 2?',
      test_id: list_of_tests[4].id },
    { body: 'R question 1?',
      test_id: list_of_tests[3].id },
    { body: 'R question 2?',
      test_id: list_of_tests[3].id },
    { body: 'R question 3?',
      test_id: list_of_tests[3].id }
  ]
)

TestPassage.create!(
  [
    { test_id: list_of_tests[0].id,
      user_id: list_of_users[0].id },
    { test_id: list_of_tests[1].id,
      user_id: list_of_users[0].id },
    { test_id: list_of_tests[2].id,
      user_id: list_of_users[0].id },
    { test_id: list_of_tests[3].id,
      user_id: list_of_users[1].id }
  ]
)

Answer.create!(
  [
    { body: 'Ruby 1 wrong 1',
      correct: false,
      question_id: list_of_questions[0].id },
    { body: 'Ruby 1 wrong 2',
      correct: false,
      question_id: list_of_questions[0].id },
    { body: 'Ruby 1 true',
      correct: true,
      question_id: list_of_questions[0].id },
    { body: 'Ruby 1 wrong 3',
      correct: false,
      question_id: list_of_questions[0].id },
    { body: 'Ruby 2 true',
      correct: true,
      question_id: list_of_questions[1].id },
    { body: 'Ruby 2 wrong 1',
      correct: false,
      question_id: list_of_questions[1].id },
    { body: 'Ruby 2 wrong 2',
      correct: false,
      question_id: list_of_questions[1].id },
    { body: 'Ruby 2 wrong 3',
      correct: false,
      question_id: list_of_questions[1].id },
    { body: 'Ruby 3 true',
      correct: true,
      question_id: list_of_questions[2].id },
    { body: 'Ruby 3 wrong 1',
      correct: false,
      question_id: list_of_questions[2].id },
    { body: 'Ruby 3 wrong 2',
      correct: false,
      question_id: list_of_questions[2].id },
    { body: 'Ruby 3 wrong 3',
      correct: false,
      question_id: list_of_questions[2].id },
    { body: 'Java 1',
      correct: true,
      question_id: list_of_questions[3].id },
    { body: 'Java 2',
      correct: true,
      question_id: list_of_questions[4].id },
    { body: 'R 1',
      correct: true,
      question_id: list_of_questions[5].id },
    { body: 'R 2',
      correct: true,
      question_id: list_of_questions[6].id },
    { body: 'R 3',
      correct: true,
      question_id: list_of_questions[7].id }
  ]
)
