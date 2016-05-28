class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :neighborhood
      t.float :bedrooms
      t.float :bathooms
      t.integer :square_footage

      t.timestamps null: false
    end
  end
end
