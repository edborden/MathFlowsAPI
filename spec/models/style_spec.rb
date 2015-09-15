describe Style do

	describe "db" do

		it { should have_db_column(:line_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:effect).of_type(:integer).with_options default:0,null:false }

		it { should have_db_index :line_id }

		it { should define_enum_for(:effect).with [:bold,:italic,:underline,:red] }

	end

	describe "associations" do

		it { should belong_to :line }

	end

	describe "validations" do
	
		it { should validate_presence_of :effect }
		it { should validate_presence_of :line }

	end

end