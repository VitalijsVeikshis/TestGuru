class CreateTestPassages < ActiveRecord::Migration[5.1]
  def change
    create_table :test_passages do |t|
      t.references :test
      t.references :user

      t.timestamps
    end
  end
end
