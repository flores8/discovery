class CreateDiscoveryCategories < ActiveRecord::Migration
  def change
    create_table :discovery_categories do |t|
      t.string :name
      t.references :personality

      t.timestamps
    end
    add_index :discovery_categories, :personality_id
  end
end
