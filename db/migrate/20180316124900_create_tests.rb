class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category
      t.references :author

      t.timestamps
    end

    add_index :tests, %i[title level], unique: true
  end
end
