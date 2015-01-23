class CreateDiscoveryStrengths < ActiveRecord::Migration
  def change
    create_table :discovery_strengths do |t|
      t.text :body
      t.references :category

      t.timestamps
    end
    add_index :discovery_strengths, :category_id
  end
end
