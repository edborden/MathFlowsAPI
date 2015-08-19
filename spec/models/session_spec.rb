require 'rails_helper'

describe Session do

	describe "db" do

		it { should have_db_column(:token).of_type(:string).with_options null:false,length:16 }
		it { should have_db_column(:user_id).of_type(:integer).with_options null:false }

		it { should have_db_index(:token).unique }
		it { should have_db_index(:user_id).unique }

	end

	describe "associations" do

		it { should belong_to :user }

	end

	describe "validations" do

		it { should validate_presence_of :user_id }
		#it { should validate_presence_of :token }

	end

end