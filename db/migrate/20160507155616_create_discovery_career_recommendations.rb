class CreateDiscoveryCareerRecommendations < ActiveRecord::Migration
  def change
    create_table :discovery_career_recommendations do |t|
      t.integer :career_id
      t.integer :category_id

      t.timestamps
    end
  end
end
