class PreferenceSerializer < ApplicationSerializer
  attributes :directions,:borders,:tour,:group_help
  has_one :user
end