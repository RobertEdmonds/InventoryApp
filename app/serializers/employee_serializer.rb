class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number

  has_many :orders 
  has_many :rented_samples
  has_many :products, through: :orders
  
end
