class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone_number, :address, :city, :state, :zip_code
end
