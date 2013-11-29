class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :password_digest
    	t.string :authenticity_token
    	t.integer :subject_number
    	t.integer :coordinator_id

      t.timestamps
    end
  end
end
