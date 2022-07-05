class AddPeriodToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :period, :date
  end
end
