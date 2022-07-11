class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :psy
      t.string :specialties

      t.timestamps
    end
  end
end
