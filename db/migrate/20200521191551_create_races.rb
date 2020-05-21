class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :name, null: false
      t.integer :abilitymodifiers, array: true, default: []
      t.string :size
      t.integer :speed
      t.string :features, array: true, default: []
      t.integer :numberskills
      t.string :skillproficiencies, array: true, default: []
      t.integer :numbertools
      t.string :toolselections, array: true, default: []
      t.integer :numberlanguages
      t.string :languageselections, array: true, default: []
      t.string :toolsandlanguages, array: true, default: []
      t.integer :luck

    end
  end
end
