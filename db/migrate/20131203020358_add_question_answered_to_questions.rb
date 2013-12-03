class AddQuestionAnsweredToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :answered, :boolean, :default => false
  end
end
