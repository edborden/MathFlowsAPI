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

		let(:page) { create :page }
		let!(:block) { create :block, page:page }

		it "destroys child blocks" do
			expect { page.destroy }.to change { Block.count }
				.from(1)
				.to 0
		end

	end

end