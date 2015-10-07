describe FoldersController do

  include_context "eager_user_with_block"

  describe "POST to #create" do

    it "creates folder" do
      expect { authenticated_req :post,:create,{folder:{name:"Test Name"}},user }
        .to change { Folder.count }
        .from(1)
        .to 2
    end

  end

  describe "PUT to #update" do

    it "updates" do
      expect { authenticated_req :put,:update,{id:folder.id,folder:{name:"New Name"}},user }
        .to change { folder.reload.name }
        .to "New Name"
    end

    context "without ownership" do

      let(:not_owner) { create :user_with_session }
      before { authenticated_req :put,:update,{id:folder.id,folder:{name:"New Name"}},not_owner }
      it { should respond_with 403 }

    end
  end

  describe "DELETE to #destroy" do

    it "destroys folder" do
      expect { authenticated_req :delete,:destroy,{id:folder.id},user }
        .to change { Folder.count }
        .from(1)
        .to 0
    end

  end

end