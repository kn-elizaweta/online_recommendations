class CreateConsultationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_requests do |t|
      t.references :patient
      t.text :query_text
      t.timestamps
    end
  end
end
