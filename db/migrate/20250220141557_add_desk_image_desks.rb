class AddDeskImageDesks < ActiveRecord::Migration[7.2]
  def change
    add_column :desks, :desk_image, :string
  end
end
