class CreateCharacterclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :characterclasses do |t|
      t.string :name, null: false
      t.integer :resources, array: true, default: []
      t.string :savingthrows, array: true, default: []
      t.string :inventoryselections, array: true, default: []
      t.string :inventory, array: true, default: []
      t.string :features, array: true, default: []
      t.integer :numberskills
      t.string :skillproficiencies, array: true, default: []
      t.string :toolsandlanguages, array: true, default: []
      t.integer :abilitymodifiers, array: true, default: []
      t.string :subclasses, array: true, default: []
    end
  end
end
