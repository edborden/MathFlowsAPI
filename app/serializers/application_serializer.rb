class ApplicationSerializer < ActiveModel::Serializer
  attributes :id
  embed :ids
end