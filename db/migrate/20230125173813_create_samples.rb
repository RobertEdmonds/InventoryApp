class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :employee, foreign_key: true
      t.integer :inventory

      t.timestamps
    end
  end
end
