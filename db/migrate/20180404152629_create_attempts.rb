class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.references :test_passage, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
