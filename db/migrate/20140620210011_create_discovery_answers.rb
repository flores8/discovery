class CreateDiscoveryAnswers < ActiveRecord::Migration
  def change
    create_table :discovery_answers do |t|
      t.string :value

      t.timestamps
    end
  end
end
