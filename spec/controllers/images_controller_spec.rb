describe ImagesController do

  include_context "user_with_block"

  describe "POST to #create" do

    it "creates image" do

      authenticated_req :post,:create,{image:{cloudinary_id:"block_images/v7bz2rx9bs65ecbhyf0n",block_id:block.id,height:100,width:100,block_position:0}},user
      should respond_with :ok
      expect(Image.count).to eq 1

    end

    context "without ownership" do

      before { authenticated_req :post,:create,{image:{cloudinary_id:"block_images/v7bz2rx9bs65ecbhyf0n",block_id:block.id}}, create(:user_with_session) }
      it { should respond_with 403 }

    end

  end

  describe "DELETE to #destroy" do
    
    let!(:image) { create :image,block:block }

    it "destroys image" do
      expect { authenticated_req :delete,:destroy,{id:image.id},user }
        .to change { Image.count }
        .from(1)
        .to 0
    end
      
  end

end