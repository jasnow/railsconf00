class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :address
      t.string :website
      t.text :description
      t.boolean :approved, null: false, default: true

      t.timestamps
    end
  end
end
