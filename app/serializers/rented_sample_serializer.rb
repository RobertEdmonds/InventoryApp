class RentedSampleSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :employee
  has_one :sample
end
