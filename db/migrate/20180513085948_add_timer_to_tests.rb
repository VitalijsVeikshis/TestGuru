class AddTimerToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timer, :bigint
  end
end
