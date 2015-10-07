describe Close do

  context "valid user with block" do
  
    include_context "user_with_block"

    it "removes user from their group" do
      group = Group.create
      group.users << user
      expect { Close.new(user) }.to change { Group.count }.by(-1) 
    end

    context "user's blocks are valid" do
      it "leaves blocks in the database" do
        expect { Close.new(user) }.to change { Block.count }.by(0) 
      end
    end

    context "user's block is invalidated" do
      before { block.update content_invalid:true }

      it "destroys block" do
        expect { Close.new(user) }.to change { Block.count }.by(-1) 
      end
    end

end

end