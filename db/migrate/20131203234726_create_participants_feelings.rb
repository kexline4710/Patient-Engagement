class CreateParticipantsFeelings < ActiveRecord::Migration
  def change
    create_table :participants_feelings do |t|
      t.integer :participant_id
      t.integer :feeling_id

      t.timestamps
    end
  end
end
