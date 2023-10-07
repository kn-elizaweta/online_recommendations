class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.references :consultation_request
      t.text :recommendation_text
      t.timestamps
    end
  end
end
