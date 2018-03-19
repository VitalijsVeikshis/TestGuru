class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category

      t.timestamps
    end
  end
end
