class AddQuestionToAnswers < ActiveRecord::Migration
  def change
    add_column :discovery_answers, :question, :integer
  end
end
