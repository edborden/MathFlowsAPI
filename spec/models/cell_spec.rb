describe Cell do

	describe "db" do

		it { should have_db_column(:table_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:row_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:col_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:content).of_type(:text).with_options default:"",null:false }

		it { should have_db_index :table_id }
		it { should have_db_index :row_id }
		it { should have_db_index :col_id }

	end

	describe "associations" do

		it { should belong_to :table }
		it { should belong_to(:row).class_name("Projection").inverse_of :row_cells }
		it { should belong_to(:col).class_name("Projection").inverse_of :col_cells }

	end

	describe "validations" do 

		it { should validate_presence_of :table_id }
		it { should validate_presence_of :row_id }
		it { should validate_presence_of :col_id }

	end

	let(:cell) { create :cell }

	describe "#row" do

		it "returns projection from row_id" do
			expect(cell.row).to be_truthy
		end

	end

	describe "#col" do

		it "returns projection from col_id" do
			expect(cell.col).to be_truthy
		end

	end

end