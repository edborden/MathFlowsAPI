describe Block do

  describe "db" do

    it { should have_db_column(:page_id).of_type :integer }
    it { should have_db_column(:user_id).of_type :integer }
    it { should have_db_column(:kind).of_type(:integer).with_options default:0,null:false }
    it { should have_db_column(:row).of_type :integer }
    it { should have_db_column(:col).of_type :integer }
    it { should have_db_column(:row_span).of_type(:integer).with_options default:1,null:false }
    it { should have_db_column(:col_span).of_type(:integer).with_options default:1,null:false }
    it { should have_db_column(:content_invalid).of_type(:boolean).with_options default:false,null:false }

    it { should have_db_index :page_id }
    it { should have_db_index :user_id }
    it { should have_db_index :kind }

    it { should define_enum_for(:kind).with [:question,:directions,:header]}

  end

  describe "associations" do

    it { should belong_to :page }
    it { should belong_to :user }
    it { should have_many(:images).dependent :destroy }
    it { should have_many(:tables).dependent :destroy }
    it { should have_many(:lines).order(:position).dependent :destroy }

  end

  describe "validations" do

    it { should validate_presence_of :kind }
    it { should validate_presence_of :row_span }
    it { should validate_presence_of :col_span }
    it { should validate_presence_of(:user_id).on(:create) }

  end

  describe "#valid" do

    let!(:valid) { create :block }
    let!(:invalid) { create :block_with_invalidation }

    it { expect(Block.valid).to contain_exactly valid }
  end

  describe "#question" do
    let!(:question) { create :block }
    let!(:directions) { create :block,kind:"directions" }

    it { expect(Block.question).to contain_exactly question }
  end

  describe "#valid_question" do

    it "returns blocks with kind:question and no invalidations" do
      valid_question = create :block
      invalid_question = create :block_with_invalidation
      directions_block = create :block, kind:"directions"

      expect(Block.valid_question).to contain_exactly valid_question
    end

  end

  describe "#processed_content" do

    context "when has children" do

      let(:block_with_children) { create :block_with_children }

      it "returns images and tables ordered by block_position" do

        expect(block_with_children.processed_content.last(2)).to eq [block_with_children.tables.first,block_with_children.images.first]

      end

    end

  end

  describe "content_invalidation"

  describe "position_invalidation"

  context "when destroyed" do

    let(:block) { create :block }

    it "destroys images" do
      create :image, block:block
      expect { block.destroy }.to change { Image.count }.by(-1)
    end

    it "destroys lines" do
      create :line, lineable:block
      expect { block.destroy }.to change { Line.count }.by(-1)
    end

  end

  describe "#amoeba" do

    let(:block) { create :block }

    it { expect(block.amoeba_dup.save).to be_truthy }

    context "when has children" do

      before { create :image,block:block }

      it "saves" do
        copy = block.amoeba_dup
        expect(copy.save).to eq true
      end

    end

  end

end