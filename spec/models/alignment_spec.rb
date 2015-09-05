describe Alignment do

	describe "db" do

		it { should have_db_column(:alignable_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:alignable_type).of_type(:string).with_options null:false }
		it { should have_db_column(:side).of_type(:integer).with_options null:false }

		it { should have_db_index([:alignable_type,:alignable_id]).unique }

		it { should define_enum_for(:side).with [:left,:right]}

	end

	describe "associations" do

		it { should belong_to :alignable }

	end

	describe "validations" do

		it { should validate_presence_of :alignable_id }
		it { should validate_presence_of :alignable_type }
		it { should validate_presence_of :side }

	end

end