class AddFirstTimeLoginToParticipants < ActiveRecord::Migration
  def change
  	add_column :participants, :first_time_login, :boolean, default: true
  end
end
