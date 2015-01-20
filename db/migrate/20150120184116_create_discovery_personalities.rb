class CreateDiscoveryPersonalities < ActiveRecord::Migration
  def change
    create_table :discovery_personalities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :discovery_personalities, :name
  end
end
