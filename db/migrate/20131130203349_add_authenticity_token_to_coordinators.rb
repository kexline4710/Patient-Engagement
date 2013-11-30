class AddAuthenticityTokenToCoordinators < ActiveRecord::Migration
  def change
  	add_column :coordinators, :authenticity_token, :string
  end
end
