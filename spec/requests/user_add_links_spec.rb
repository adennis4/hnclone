require 'spec_helper'

describe "UserAddLinks" do
  it "adds a link and redirects to index" do
    visit new_link_path
    fill_in 'Url', :with => "http://devbootcamp.com"
    fill_in 'Title', :with => "homepage for devbootcamp"
    click_button "Add"
    current_path.should == links_path
    page.should have_content("homepage for devbootcamp")
  end
end
