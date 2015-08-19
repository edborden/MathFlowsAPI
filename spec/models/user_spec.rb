require 'rails_helper'

describe User do

	describe "db" do

		it { should have_db_column(:email).of_type :string }
		it { should have_db_column(:name).of_type :string }
		it { should have_db_column(:pic).of_type :string }
		it { should have_db_column(:gender).of_type :integer }
		it { should have_db_column(:created_at).of_type :datetime }
		it { should have_db_column(:group_id).of_type :integer }
		it { should have_db_column(:uservoice_token).of_type :string }
		it { should have_db_column(:tests_count).of_type(:integer).with_options default: 0, null:false }
		it { should have_db_column(:tests_quota).of_type(:integer).with_options default: 25, null:false }
		it { should have_db_column(:referred_by).of_type :string }
		
		it { should have_db_index(:email).unique }
		it { should have_db_index :group_id }

		it { should define_enum_for(:gender).with [:male,:female] }

	end

	describe "associations" do

		it { should have_one(:session).dependent :destroy }
		it { should have_many(:folders).dependent :destroy }
		it { should have_many :blocks }
		it { should have_many(:tests).dependent :destroy }
		it { should belong_to(:group).counter_cache }
		it { should have_one(:preference).dependent :destroy }
		it { should have_many(:invitations_sent).dependent :destroy }
		it { should have_one(:invitation).dependent :nullify }
		it { should have_many(:groupvitations_sent).dependent :destroy }
		it { should have_many(:groupvitations).dependent :destroy }
		it { should have_one(:plan).dependent :destroy }
		it { should have_one(:google).dependent :destroy }

	end

	describe "validations" do

		it { should validate_uniqueness_of(:email).allow_nil.case_insensitive }

	end

	let(:user) { create :user }

	context "after create" do

		it { expect(user.preference).to be_valid }
		it { expect(user.plan).to be_valid }
		it { expect(user.create_session).to be_valid }

	end

	context "when destroyed" do

		it "destroys invitations_sent" do
			create :invitation, referrer: user
			expect { user.destroy }.to change { Invitation.count }.by(-1)
		end

		it "nullifies referral_id on invitation" do
			referrer = create :user
			invitation = create :invitation, referrer:referrer,referral_email:user.email,referral:user
			expect { user.destroy }.to change { invitation.reload.referral_id }
				.from(user.id)
				.to(nil)
		end

		it "destroys session" do
			user.create_session
			expect { user.destroy }.to change { Session.count }.by(-1)		
		end

		it "destroys tests" do
			folder = create :folder, user:user
			test =  create :test, user:user,folder:folder 
			expect { user.destroy }.to change { Test.count }.by(-1)
		end

		it "nullifies user_id on blocks"

		it "destroys preference"

		it "destroys groupvitations_sent"

		it "destroys groupvitations"

		it "destroys headers and blocks in clipboard"

	end

end