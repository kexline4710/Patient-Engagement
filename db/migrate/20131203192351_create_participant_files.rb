class CreateParticipantFiles < ActiveRecord::Migration
  def change
  	create_table :participant_files do |t|
  		t.integer :coordinator_id
  		t.attachment :subject_list
  	end
  end
end
