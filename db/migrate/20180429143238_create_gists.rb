class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :question, foreign_key: { to_table: :questions }, null: false
      t.references :user, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
