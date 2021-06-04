class CreateMakeupBags < ActiveRecord::Migration[6.1]
  def change
    create_table :makeup_bags do |t|
      t.integer :bag_id
      t.integer :makeup_id
      t.string :store_location
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
