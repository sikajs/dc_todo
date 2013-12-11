class AddCompleteToTasks < ActiveRecord::Migration
  def change
		add_column :tasks, :completed, :boolean
		add_column :tasks, :completed_at, :timestamp
  end
end
