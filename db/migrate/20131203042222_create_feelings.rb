class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
    	t.string :emotion
      t.timestamps
    end
  end
end
