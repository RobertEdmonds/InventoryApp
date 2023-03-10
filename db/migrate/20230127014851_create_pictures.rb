class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :picture_url
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
