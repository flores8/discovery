class AddTypeToQuestion < ActiveRecord::Migration
  def change
    add_column :question, :type, :string
    add_index :question, :type
  end
end
