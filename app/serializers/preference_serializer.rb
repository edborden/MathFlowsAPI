class PreferenceSerializer < ApplicationSerializer
  attributes :directions,:borders,:tour,:group_help,:me_group_help,:me_test_help
  has_one :user
end