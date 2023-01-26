class SampleSerializer < ActiveModel::Serializer
  attributes :id, :inventory
  has_one :product
  has_one :user
  has_one :employee
end
