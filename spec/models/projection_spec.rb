describe Projection do

  describe "db" do

    it { should have_db_column(:table_id).of_type(:integer).with_options null:false }
    it { should have_db_column(:axis).of_type(:integer).with_options null:false}
    it { should have_db_column(:position).of_type(:float).with_options null:false,default:1.0 }
    it { should have_db_column(:size).of_type(:integer).with_options null:false,default:15 }

    it { should have_db_index [:table_id,:axis] }

    it { should define_enum_for(:axis).with [:row,:col]}

  end

  describe "associations" do

    it { should belong_to :table }
    it { should have_many(:row_cells).dependent(:destroy).class_name("Cell").with_foreign_key("row_id") }
    it { should have_many(:col_cells).dependent(:destroy).class_name("Cell").with_foreign_key("col_id") }

  end

  describe "validations" do 

    #it { should validate_presence_of :table_id } #breaks amoeba
    it { should validate_presence_of :axis }
    it { should validate_presence_of :position }

  end

  describe "#cells" do

    context "when axis:row" do

      let(:row) { create :row_with_cells }

      it "returns row_cells" do
        expect(row.cells.count).to eq 3
      end

    end

    context "when axis:col" do

      let(:col) { create :col_with_cells }

      it "returns col_cells" do
        expect(col.cells.count).to eq 3
      end

    end

  end

end