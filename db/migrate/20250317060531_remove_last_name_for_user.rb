class RemoveLastNameForUser < ActiveRecord::Migration[7.2]
  def up
    remove_column :users, :last_name, :string
  end

  def down
    add_column :users, :last_name, :string
  end
end
