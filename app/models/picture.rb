class Picture < ApplicationRecord
  belongs_to :product

  validates :picture_url, presence: true, uniqueness: true 
  validates :product_id, presence: true
end
