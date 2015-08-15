require 'test_helper'

class UserTest < ActiveSupport::TestCase

	# DB

	should have_db_column(:email).of_type(:string)
	should have_db_column(:name).of_type(:string)
	should have_db_column(:pic).of_type(:string)
	should have_db_column(:google_id).of_type(:string)
	should have_db_column(:gender).of_type(:integer)
	should have_db_column(:google_link).of_type(:string)
	should have_db_column(:google_refresh).of_type(:string)
	should have_db_column(:created_at).of_type(:datetime)
	should have_db_column(:group_id).of_type(:integer)
	should have_db_column(:guest).of_type(:boolean).with_options(default: true, null: false)
	should have_db_column(:uservoice_token).of_type(:string)
	should have_db_column(:tests_count).of_type(:integer).with_options(default: 0, null:false)
	should have_db_column(:tests_quota).of_type(:integer).with_options(default: 25, null:false)
	should have_db_column(:referred_by).of_type(:string)
	should have_db_index(:google_id).unique
	should have_db_index(:email).unique
	should have_db_index(:group_id)

	should define_enum_for(:gender).with(:male,:female)

	# ASSOCIATIONS

	should have_one :session
	should have_many :folders
	should have_many :blocks
	should have_many :tests
	should belong_to(:group).counter_cache
	should have_one :preference
	should have_many :invitations_sent
	should have_one :invitation
	should have_many :groupvitations_sent
	should have_many(:groupvitations).conditions(declined:false)

	# VALIDATIONS

	should validate_uniqueness_of(:email).allow_nil
	should validate_uniqueness_of(:google_id).allow_nil

	def setup
		@user = Fabricate :user
	end

	test "after create, creates preference" do
		assert @user.preference
	end

	test "test_count" do
		user_with_block
		assert_equal 1,@user.tests(true).size
		@test.destroy
		assert_equal 0,@user.tests(true).size
	end

end