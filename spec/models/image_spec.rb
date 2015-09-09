describe Image do

	describe "db" do

		it { should have_db_column(:block_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:width).of_type(:integer).with_options null:false }
		it { should have_db_column(:height).of_type(:integer).with_options null:false }
		it { should have_db_column(:cloudinary_id).of_type(:string).with_options null:false }
		it { should have_db_column(:block_position).of_type(:integer) }

		it { should have_db_index :block_id }

	end

	describe "associations" do

		it { should belong_to :block }
		it { should have_one(:alignment).dependent :destroy }

	end

	describe "validations" do

		it { should validate_presence_of :block_id }
		it { should validate_presence_of :width }
		it { should validate_presence_of :height }
		it { should validate_presence_of :cloudinary_id }

	end

	let(:image) { create :image }

	context "after creation" do

		it "creates alignment" do
			expect(image.alignment).to be_truthy
		end

		it "sets block_position" do
			expect(image.block_position).to eq 0
		end

	end

end