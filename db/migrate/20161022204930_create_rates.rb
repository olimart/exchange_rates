class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string   :from_iso_code, null: false
      t.string   :to_iso_code,   null: false
      t.float    :rate,          null: false
      t.datetime :date,          null: false

      t.timestamps
    end

    add_index :rates, :from_iso_code
    add_index :rates, [:from_iso_code, :to_iso_code], unique: true
  end
end
