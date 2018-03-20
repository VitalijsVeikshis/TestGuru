class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.references :question
      t.references :user

      t.timestamps
    end
  end
end
