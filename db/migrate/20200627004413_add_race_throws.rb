class AddRaceThrows < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :savingthrows, :string, array: true, default: []
  end
end
