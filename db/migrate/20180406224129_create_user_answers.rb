class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.references :test_passage, foreign_key: { to_table: :test_passages }
      t.references :answer, foreign_key: { to_table: :answers }

      t.timestamps
    end
  end
end
