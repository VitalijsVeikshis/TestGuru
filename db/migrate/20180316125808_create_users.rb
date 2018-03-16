class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.primary_key :id
      t.string :name
      t.integer :answer_id

      t.timestamps
    end
  end
end
