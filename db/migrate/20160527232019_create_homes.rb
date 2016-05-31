class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :neighborhood
      t.integer :bedrooms
      t.float :bathrooms
      t.integer :square_footage
      t.boolean :sold
      t.belongs_to :seller

      t.timestamps null: false
    end
  end
end
