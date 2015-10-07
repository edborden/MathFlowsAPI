describe TableCopy do

  before do
    @table = create :table_with_content
    @new_block = create :block
    @copy = TableCopy.new(@table,@new_block)
  end

  it "works" do

    expect(Table.count).to eq 2
    expect(Projection.count).to eq 4
    expect(Cell.count).to eq 2

  end

end