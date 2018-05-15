class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :picture_url, null: false
      t.string :type, default: 'Badge', null: false
      t.jsonb :params

      t.timestamps
    end
  end
end
