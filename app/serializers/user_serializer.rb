class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone_number, :address, :city, :state, :zip_code

  has_many :samples 
  has_many :orders 
  has_many :products, through: :orders 
  has_many :rented_samples
  has_many :samples, through: :rented_samples
end
