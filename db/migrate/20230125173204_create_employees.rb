class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :phone_number
      t.boolean :boss, default: false

      t.timestamps
    end
  end
end
