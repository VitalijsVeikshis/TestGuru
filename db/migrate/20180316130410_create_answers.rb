class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers, id: false do |t|
      t.primary_key :id
      t.string :body
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
