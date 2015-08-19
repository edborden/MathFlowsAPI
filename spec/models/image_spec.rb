describe Image do

	describe "db" do

		it { should have_db_column(:block_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:width).of_type(:integer).with_options null:false }
		it { should have_db_column(:height).of_type(:integer).with_options null:false }
		it { should have_db_column(:cloudinary_id).of_type(:string).with_options null:false }

		it { should have_db_index :block_id }

	end

	describe "associations" do

		it { should belong_to :block }

	end

	describe "validations" do

		it { should validate_presence_of :block_id }
		it { should validate_presence_of :width }
		it { should validate_presence_of :height }
		it { should validate_presence_of :cloudinary_id }

	end

end