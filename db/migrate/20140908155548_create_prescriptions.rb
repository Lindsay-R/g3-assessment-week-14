class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.string :dosage
      t.string :schedule
      t.date :date_start
      t.date :date_end
      t.integer :medication_id
    end
  end
end
