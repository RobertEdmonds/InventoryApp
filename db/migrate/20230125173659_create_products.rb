class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.integer :inventory
      t.string :color

      t.timestamps
    end
  end
end
