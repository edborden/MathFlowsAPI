describe BlocksController do

  include_context "eager_user_with_block"

  describe "POST to #create" do

    it "creates new block with default line" do

      authenticated_req :post,:create,{block:{page_id:page.id}},user
      expect(Block.last.user).to eq user
      expect(json_response["lines"][0]).to be_truthy

    end

    context "when user isnt owner of page" do

      before { authenticated_req :post,:create,{block:{page_id:page.id}}, create(:user_with_session) }
      it { should respond_with :forbidden }
      it "should not create a block" do
        expect(Block.count).to eq 1
      end

    end

  end

  describe "POST to #copy" do

    context "as anyone" do

      it "runs BlockCopy" do

        expect(BlockCopy).to receive(:new).with(block,user).and_return double(block: create(:block,user:user))
        authenticated_req :post,:copy,{id:block.id},user
        should respond_with :ok
        expect(json_response["block"]["user_id"].to_i).to eq user.id

      end

    end

  end

  describe "POST to #validate" do

    it "runs validate" do

    end

  end

  describe "PUT to #update" do

    it "updates block" do
      expect { authenticated_req :put,:update,{id:block.id,block:{row_span:4,col_span:1,row:1,col:1}},user }
        .to change { block.reload.row_span }
        .from(1)
        .to 4
    end
  end

  describe "DELETE to #destroy" do

    it "destroys block" do
      expect { authenticated_req :delete,:destroy,{id:block.id},user }
        .to change { Block.count }
        .from(1)
        .to 0
    end

  end

end