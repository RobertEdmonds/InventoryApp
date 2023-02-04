class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :employee

  validates :amount, presence: true
  validates :total_price, presence: true 
end
