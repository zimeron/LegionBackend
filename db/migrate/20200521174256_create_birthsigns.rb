class CreateBirthsigns < ActiveRecord::Migration[6.0]
  def change
    create_table :birthsigns do |t|
      t.string :name, null: false
      t.int :abilitymodifiers, array: true, default: [0, 0, 0, 0, 0, 0]
      t.string :features, array: true, default: []

      t.timestamps
    end
  end
end
