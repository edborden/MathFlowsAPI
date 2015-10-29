class ColleagueSerializer < ApplicationSerializer
  attributes :name,:pic,:email,:created_at,:tests_count
  has_many :tests, embed: :ids, include: :true
  has_many :folders, embed: :ids, include: :true
  has_one :group
end