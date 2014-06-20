class CreateDiscoveryQuestions < ActiveRecord::Migration
  def change
    create_table :discovery_questions do |t|
      t.string :question
      t.string :option_1
      t.string :option_2
      t.string :personality_type
      t.string :option_1_value
      t.string :option_2_value

      t.timestamps
    end
  end
end
