describe LinesController do

  include_context "user_with_block"

  describe "POST to #create" do

    it "creates line" do
      authenticated_req :post,:create,{line:{block_id:block.id}},user
      should respond_with :ok
      expect(Line.count).to eq 1
    end

    context "without ownership" do

      before { authenticated_req :post,:create,{line:{block_id:block.id}}, create(:user_with_session) }
      it { should respond_with 403 }

    end

  end

  describe "PUT to #update" do

    before { authenticated_req :put,:update,{id:line.id,line:{content:"test"}},user }
    
    it { should respond_with :ok }
    it "updates line" do
      expect(json_response["line"]["content"]).to eq "test"
    end

  end

  describe "DELETE to #destroy" do

    context "with ownership" do

      before { authenticated_req :delete,:destroy,{id:line.id},user }

      it { should respond_with :no_content }

      it "deletes line" do
        expect(Line.count).to eq 0
      end

    end

    context "without ownership" do

      before { authenticated_req :delete,:destroy,{id:line.id},create(:user_with_session) }

      it { should respond_with 403 }

    end

  end

end