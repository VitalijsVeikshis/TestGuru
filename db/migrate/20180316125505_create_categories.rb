class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: false do |t|
      t.primary_key :id
      t.string :title

      t.timestamps
    end
  end
end
