describe Table do

	describe "db" do

		it { should have_db_column(:block_id).of_type(:integer).with_options null:false }
		it { should have_db_column(:rows_count).of_type(:integer).with_options null:false,default:0 }
		it { should have_db_column(:cols_count).of_type(:integer).with_options null:false,default:0 }

		it { should have_db_index :block_id }

	end

	describe "associations" do

		it { should belong_to :block }
		it { should have_many(:projections).dependent(:destroy) }
		it { should have_many(:cells) }

	end

	describe "validations" do 

		it { should validate_presence_of :block_id }

	end

	let(:table) { create :table_with_content }

	describe "#rows" do

		it "returns projections with axis:0" do		
			expect(table.rows.first.row?).to be true
		end

	end

	describe "#cols" do

		it "returns projections with axis:1" do		
			expect(table.cols.first.col?).to be true
		end

	end

	context "after create" do

		let(:table) { create :table, rows_count:3,cols_count:2}

		it "creates rows to match rows_count" do
			expect(table.rows.count).to be 3
		end

		it "retains correct rows_count" do
			expect(table.reload.rows_count).to be 3
		end

		it "creates cols to match cols_count" do
			expect(table.cols.count).to be 2
		end

		it "retains correct cols_count" do
			expect(table.reload.cols_count).to be 2
		end

	end
	
end