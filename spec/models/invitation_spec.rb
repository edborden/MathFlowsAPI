describe Invitation do

	describe "db" do

		it { should have_db_column(:referrer_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:referral_id).of_type :integer }
		it { should have_db_column(:referral_email).of_type(:string).with_options null:false }
		it { should have_db_column(:status).of_type(:integer).with_options null:false,default:0 }
		it { should have_db_column(:created_at).of_type :datetime }
		it { should have_db_column(:updated_at).of_type :datetime }

		it { should define_enum_for(:status).with [:sent,:visited,:signed_up] }

		it { should have_db_index(:referral_id).unique }
		it { should have_db_index :referrer_id }
		it { should have_db_index(:referral_email).unique }

	end

	describe "associations" do

		it { should belong_to :referrer }
		it { should belong_to :referral }

	end

	describe "validations" do

		subject { create :invitation }

		it { should validate_presence_of :referral_email }
		it { should validate_presence_of :referrer_id }		
		it { should validate_uniqueness_of :referral_email }

	end

end