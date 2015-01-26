class CreateDiscoveryCareerContentments < ActiveRecord::Migration
  def change
    create_table :discovery_career_contentments do |t|
      t.text :body
      t.references :personality

      t.timestamps
    end
    add_index :discovery_career_contentments, :personality_id
  end
end
