class AddTimeLeftToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :time_left, :bigint
  end
end
