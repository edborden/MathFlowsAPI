describe Alignment do

	describe "db" do

		it { should have_db_column(:alignable_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:alignable_type).of_type(:string).with_options null:false }
		it { should have_db_column(:side).of_type(:integer).with_options null:false }

		it { should have_db_index([:alignable_type,:alignable_id]).unique }

	describe "associations" do

		it { should belong_to :alignable }

	end

	describe "validations" do

		it { should validate_presence_of :alignable_id }
		it { should validate_presence_of :alignable_type }
		it { sohuld validate_presence_of :side }

	end

end