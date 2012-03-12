require 'spec_helper'

describe 'links/new' do
  context "form" do
    before do
      assign(:link, Link.new)
      render
    end
    
  it 'has a form posting to /links' do
    assign(:link, Link.new)
    render
    rendered.should have_tag('form', :with => { :action => "/links", :method => })
      with_tag "input", :with => { :name => "link[url]"}
      with_tag "input", :with => { :name => "link[title]"}
  end
  
  context "errors" do
    before do
      link = Link.new
      link.valid?
      assign(:link, link)
      render
    end
    it "displays errors when link saving fails" do
      rendered.should have_content("cannot be blank")
    end
  end
end
