class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions, id: false do |t|
      t.primary_key :id
      t.string :body
      t.integer :test_id

      t.timestamps
    end
  end
end
