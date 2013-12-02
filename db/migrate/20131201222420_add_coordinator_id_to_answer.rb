class AddCoordinatorIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :coordinator_id, :integer
  end
end
