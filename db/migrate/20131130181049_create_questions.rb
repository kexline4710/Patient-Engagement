class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer  :participant_id
      t.string   :title
      t.text     :content
      t.timestamps
    end
  end
end
