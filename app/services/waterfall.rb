class Waterfall

  def user mold
    user = User.create mold[:params]
    mold[:blocks].each do |block_mold| 
      block_mold[:params][:kind] = "header"
      block block_mold,user
    end
    mold[:folders].each { |folder_mold| folder(folder_mold,user) }
    return user
  end

  def folder mold,user
    folder = Folder.create mold[:params].merge user_id:user.id
    mold[:tests].each { |test_mold| test(test_mold,folder,user) }
    return folder
  end

  def test mold,folder,user
    test = Test.create mold[:params].merge folder_id:folder.id,user_id:user.id
    mold[:pages].each { |page_mold| page(page_mold,test,user) }
    return test
  end

  def page mold,test,user
    page = Page.create mold[:params].merge test_id:test.id
    mold[:blocks].each { |block_mold| block(block_mold,user,page) }
    return page
  end

  def block mold,user=nil,page=nil
    block = Block.create mold[:params].merge user_id:user.try(:id),page_id:page.try(:id)
    mold[:lines].each { |line_mold| line(line_mold,block) }
    image(mold[:image],block) if mold[:image]
    return block
  end

  def line mold,block
    Line.create mold.merge lineable_id:block.id,lineable_type:"Block"
  end

  def image mold,block
    Image.create mold[:params].merge block_id:block.id
  end

end