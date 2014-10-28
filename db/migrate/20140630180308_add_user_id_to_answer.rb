class AddUserIdToAnswer < ActiveRecord::Migration
  def change
  	add_column :discovery_answers, :user_id, :integer
  end
end
