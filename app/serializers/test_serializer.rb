class TestSerializer < ApplicationSerializer
  attributes :name
  has_many :pages
  has_one :folder
  has_many :blocks
  has_one :user
end