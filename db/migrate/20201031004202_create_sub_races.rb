class CreateSubRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_races do |t|
      t.string :name, null: false
      t.string :features, array: true, default: []
      t.integer :abilitymodifiers, array: true, default: []
      t.string :size, null: false
      t.string :skillproficiencies, array: true, default: []
      t.string :toolsandlanguages, array: true, default: []
      t.string :race, null: false
      t.timestamps
    end
  end
end
