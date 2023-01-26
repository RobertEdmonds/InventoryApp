class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :boss
end
