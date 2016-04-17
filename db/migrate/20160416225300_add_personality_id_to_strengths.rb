class AddPersonalityIdToStrengths < ActiveRecord::Migration
  def change
    add_column :discovery_strengths, :personality_id, :integer
    add_index :discovery_strengths, :personality_id
  end
end
