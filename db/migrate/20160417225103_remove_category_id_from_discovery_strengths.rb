class RemoveCategoryIdFromDiscoveryStrengths < ActiveRecord::Migration
  def up
    remove_column :discovery_strengths, :category_id
  end

  def down
    add_column :discovery_strengths, :category_id, :integer
  end
end
