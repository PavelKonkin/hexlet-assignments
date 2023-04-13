class ChangeColumnDefaultTopic < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :status, 'new'
    change_column_default :tasks, :completed, false
  end
end
