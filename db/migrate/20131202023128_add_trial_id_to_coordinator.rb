class AddTrialIdToCoordinator < ActiveRecord::Migration
  def change
    add_column :coordinators, :trial_id, :integer
  end
end
