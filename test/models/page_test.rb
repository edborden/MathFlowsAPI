require 'test_helper'

class PageTest < ActiveSupport::TestCase

	test "create_default" do
		skip
		p = Page.create_default
		assert_equal 2,Position.count
		assert_equal 1,Block.count
		assert_equal 1,Snippet.count
		assert_equal 1,p.child_positions.count
	end

	test "layout" do
		l = FlowLayout.default
		f = Flow.create
		f.layout = l
		assert_equal l,f.layout
		doc = Document.create
		f.documents<<doc
		assert f.documents.include? doc
		page = Page.create
		doc.pages<<page
		assert doc.pages.include? page
		assert_equal l,page.layout
	end

end