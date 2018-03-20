# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LIST_OF_CATEGORIES = [
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Machine Learning' }
].freeze

LIST_OF_TESTS = [
  { title: 'Ruby', level: 1, category_id: 2 },
  { title: 'JS', level: 0, category_id: 1 },
  { title: 'Rails', level: 2, category_id: 2 },
  { title: 'R', level: 5, category_id: 3 },
  { title: 'Java', level: 3, category_id: 2 }
].freeze

LIST_OF_QUESTIONS = [
  { body: 'Ruby question 1? (Ruby 1)', test_id: 1 },
  { body: 'Ruby question 2? (Ruby 2)', test_id: 1 },
  { body: 'Ruby question 3? (Ruby 3)', test_id: 1 },
  { body: 'Java question 1? (Java 1)', test_id: 5 },
  { body: 'Java question 2? (Java 2)', test_id: 5 },
  { body: 'R question 1? (R 1)', test_id: 4 },
  { body: 'R question 2? (R 2)', test_id: 4 },
  { body: 'R question 3? (R 3)', test_id: 4 }
].freeze

LIST_OF_USERS = [
  { name: 'User1' },
  { name: 'User2' },
  { name: 'User3' },
  { name: 'User4' }
].freeze

LIST_OF_ANSWERS = [
  { body: 'Ruby 1', correct: true, question_id: 1, user_id: 1 },
  { body: 'Ruby 2 wrong answer', correct: false, question_id: 2, user_id: 1 },
  { body: 'Ruby 3', correct: true, question_id: 3, user_id: 1 },
  { body: 'Ruby 1 wrong answer', correct: false, question_id: 1, user_id: 2 },
  { body: 'Ruby 2 wrong answer', correct: false, question_id: 2, user_id: 2 },
  { body: 'Ruby 3 wrong answer', correct: false, question_id: 3, user_id: 2 },
  { body: 'Java 1', correct: true, question_id: 4, user_id: 2 },
  { body: 'Java 2', correct: true, question_id: 5, user_id: 2 }
].freeze

Category.create(LIST_OF_CATEGORIES)
Test.create(LIST_OF_TESTS)
Question.create(LIST_OF_QUESTIONS)
User.create(LIST_OF_USERS)
Answer.create(LIST_OF_ANSWERS)
