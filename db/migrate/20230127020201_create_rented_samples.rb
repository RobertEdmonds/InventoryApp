class CreateRentedSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :rented_samples do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
