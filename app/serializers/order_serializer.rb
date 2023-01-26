class OrderSerializer < ActiveModel::Serializer
  attributes :id, :amount, :total_price
  has_one :user
  has_one :product
  has_one :employee
end
