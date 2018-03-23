class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
