class AddCompletedAtToTodoItems < ActiveRecord::Migration
  def change
    add_column :tdo_items, :completed_at, :datetime
  end
end
