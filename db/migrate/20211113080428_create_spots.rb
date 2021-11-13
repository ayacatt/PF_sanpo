class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :address
      t.string :post_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
