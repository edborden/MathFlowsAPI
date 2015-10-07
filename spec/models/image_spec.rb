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

    #it { should validate_presence_of :block_id } #breaks amoeba
    it { should validate_presence_of :width }
    it { should validate_presence_of :height }
    it { should validate_presence_of :cloudinary_id }
    it { should validate_presence_of :block_position }

  end

  let(:image) { create :image }

  context "after creation" do

    it "creates alignment" do
      expect(image.alignment).to be_truthy
    end

  end

  describe "#amoeba" do

    it "copies alignment, doesn't create a new one" do
      image.alignment.center!
      image.alignment.save
      copy = image.amoeba_dup
      copy.save
      expect(copy.alignment.side).to eq "center"
    end
  end

end