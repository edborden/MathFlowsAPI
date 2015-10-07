class FolderSerializer < ApplicationSerializer
  attributes :name,:open,:contents
  has_many :tests, embed: :ids, include: :true
  has_one :user
  has_many :folders
  has_one :folder
end