class AddFirstNameAndLastNameToCoordinator < ActiveRecord::Migration
  def change
    add_column :coordinators, :first_name, :string
    add_column :coordinators, :last_name, :string
  end
end
