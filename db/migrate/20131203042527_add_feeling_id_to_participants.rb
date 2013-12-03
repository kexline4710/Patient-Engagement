class AddFeelingIdFieldToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :feeling_id, :default => NULL
  end
end
