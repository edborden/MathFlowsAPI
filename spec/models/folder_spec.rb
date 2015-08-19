describe Folder do

	describe "db" do

		it { should have_db_column(:user_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:folder_id).of_type :integer }
		it { should have_db_column(:name).of_type(:string).with_options default:"My Folder",null: false }
		it { should have_db_column(:open).of_type(:boolean).with_options default: true, null: false }
		it { should have_db_column(:contents).of_type(:integer).with_options default: 0, null: false }

		it { should have_db_index :folder_id }
		it { should have_db_index :user_id }

		it { should define_enum_for(:contents).with [:tests] }

	end


	describe "associations" do

		it { should belong_to :user }
		it { should have_many(:tests).dependent(:destroy) }
		it { should have_many :folders }
		it { should belong_to :folder }

	end

	describe "validations" do 

		it { should validate_presence_of :user_id }
		it { should validate_presence_of :name }
		it { should validate_presence_of :open }
		it { should validate_presence_of :contents }

	end

	context "when contains tests" do

		let(:folder) { create :folder_with_test }

		it "destroys dependents when destroyed" do
			folder.destroy
			expect(Test.all).not_to include folder.tests.first
		end

	end

	context "when destroyed" do

		it "destroys tests"

	end

end