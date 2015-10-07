describe PagesController do

  include_context "user_with_block"
  let(:not_owner) { create :user_with_session }

  describe "POST to #create" do

    context "with ownership" do

      before { authenticated_req :post,:create,{page:{test_id:test.id}},user }
      it { should respond_with :ok }
      it "creates page" do
        expect(Page.count).to eq 1
      end

    end

    context "without ownership" do

      before { authenticated_req :post,:create,{page:{test_id:test.id}}, not_owner }
      it { should respond_with :forbidden }

    end

  end

  describe "GET to #show" do

    context "with ownership" do
    
      before { authenticated_req :get,:show,{id:page.id},user }

      it { should respond_with :ok }
      it "renders page" do
        expect(json_response["page"]["id"]).to eq page.id
      end

    end

    context "without ownership" do

      before { authenticated_req :get,:show,{id:page.id},not_owner }
      it { should respond_with :forbidden }

    end

  end 

  describe "DELETE to #destroy" do

    before { authenticated_req :delete,:destroy,{id:page.id},user }

    it { should respond_with :no_content }
    it "deletes page" do
      expect(Page.count).to eq 0
    end

  end

end