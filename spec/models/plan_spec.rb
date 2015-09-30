describe Plan do

	describe "db" do

		it { should have_db_column(:level).of_type(:integer).with_options null:false,default:0 }
		it { should have_db_column(:user_id).of_type :integer }
		it { should have_db_index(:user_id).unique }

		it { should define_enum_for(:level).with [:guest,:basic] }

	end

	describe "associations" do

		it { should belong_to :user }

	end

	describe "validations" do

		subject { create(:user).plan }
		it { should validate_uniqueness_of(:user_id).on(:create) }
		it { should validate_presence_of :user_id }
		it { should validate_presence_of :level }

	end

end