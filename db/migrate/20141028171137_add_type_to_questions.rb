class AddTypeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :string
    add_index :questions, :type
  end
end
