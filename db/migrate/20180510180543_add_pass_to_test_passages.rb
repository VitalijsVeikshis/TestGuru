class AddPassToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :pass, :boolean, default: false, null: false
  end
end
