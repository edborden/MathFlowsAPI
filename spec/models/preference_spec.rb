describe Preference do

	describe "db" do

		it { should have_db_column(:borders).of_type(:boolean).with_options default:false,null:false }
		it { should have_db_column(:directions).of_type(:boolean).with_options default:false,null:false }
		it { should have_db_column(:tour).of_type(:boolean).with_options default:true,null:false }
		it { should have_db_column(:user_id).of_type(:integer).with_options null:false }

		it { should have_db_index(:user_id).unique }

	end

	describe "associations" do

		it { should belong_to :user }

	end

	describe "validations" do

		it { should validate_presence_of :user_id }

	end

end