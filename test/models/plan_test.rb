require 'test_helper'

class PlanTest < ActiveSupport::TestCase

	# DB

	should have_db_column(:level).of_type(:integer).with_options(null:false,default:0)
	should have_db_column(:user_id).of_type(:integer)
	should have_db_index(:user_id).unique

	should define_enum_for(:level).with([:guest,:basic])

	# ASSOCIATIONS

	should belong_to :user

end