class AddFeelingIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :feeling_id, :integer, :default => nil
  end
end
