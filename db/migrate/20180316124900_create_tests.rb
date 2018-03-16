class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests, id: false do |t|
      t.primary_key :id
      t.string :title
      t.integer :level
      t.integer :category_id

      t.timestamps
    end
  end
end
