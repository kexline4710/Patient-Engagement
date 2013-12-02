class AddDetailsToTrial < ActiveRecord::Migration
  def change
    add_column :trials, :title, :string
    add_column :trials, :number, :integer
  end
end
