class CreateMakeups < ActiveRecord::Migration[6.1]
  def change
    create_table :makeups do |t|
      t.string :product
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
