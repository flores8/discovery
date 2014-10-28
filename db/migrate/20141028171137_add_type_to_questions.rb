class AddTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :discovery_questions, :question_type, :string
    add_index :discovery_questions, :question_type
  end
end
