class RemovePersonality < ActiveRecord::Migration[6.0]
  def change
    remove_column :backgrounds, :personalities
    remove_column :backgrounds, :ideals
    remove_column :backgrounds, :flaws
    remove_column :backgrounds, :bonds
  end
end
