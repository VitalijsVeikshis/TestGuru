class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.references :test
      t.references :user

      t.timestamps
    end
  end
end
