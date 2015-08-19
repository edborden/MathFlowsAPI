require 'rails_helper'

describe Google do
	
	describe "db" do

		it { should have_db_column(:google_id).of_type(:string) }
		it { should have_db_column(:link).of_type(:string) }
		it { should have_db_column(:refresh).of_type(:string) }
		it { should have_db_column(:user_id).of_type(:integer) }
		
		it { should have_db_index(:user_id).unique }
		it { should have_db_index(:google_id).unique }

	end

	describe "associations" do

		it { should belong_to :user }

	end

	describe "validations" do

		subject { create :google }
		it { should validate_uniqueness_of :google_id }
		it { should validate_presence_of :user_id }
		it { should validate_uniqueness_of :user_id }

	end
end