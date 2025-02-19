class CreateDesks < ActiveRecord::Migration[7.2]
  def change
    create_table :desks do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
