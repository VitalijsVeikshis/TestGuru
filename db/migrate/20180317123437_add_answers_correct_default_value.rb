class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[5.1]
  def up
    change_column_default :answers, :correct, false
  end

  def down
    change_column_default :answers, :correct, nil
  end
end
