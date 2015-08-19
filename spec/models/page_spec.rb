describe Page do

	describe "db" do

		it { should have_db_column(:test_id).of_type(:integer).with_options null:false }
		it { should have_db_index :test_id }

	end

	describe "associations" do

		it { should belong_to :test }
		it { should have_many(:blocks).dependent :destroy }

	end

	describe "validations" do

		it { should validate_presence_of :test_id }

	end

	context "when destroyed" do

		it "destroys blocks"

	end

end