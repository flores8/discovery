class CreateDiscoveryMajorRecommendations < ActiveRecord::Migration
  def change
    create_table :discovery_major_recommendations do |t|
      t.integer :major_id
      t.integer :category_id

      t.timestamps
    end
  end
end
