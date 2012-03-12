require 'spec_helper'

describe LinksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    it 'assigns @link' do
      get 'new'
      assigns[:link].should_not be_nil
      assigns[:link].should be_instance_of(Link)
    end
  end

  describe "GET 'create'" do
    context "when saving successfully" do
      let(:success_params) do
        {:link => {:url => 'http://devbootcamp.com', :title => 'Yeah!'}}
      end
      
      it 'redirect to index' do
        post :create, success_params
        response.should redirect_to(links_path)
      end
      it 'gives a "success" message' do
        post :create, success_params
        flash[:notice].should == 'Link Added'
      end
      it 'saves the link' do
        expect {
          post :create, success_params
          }.to change(Link, :count).by(1)
        end
      end
    end
    
    context "when saving fails" do
      let(:failing_params) {{:link => {:url => '', :title => ''}}}
      it 'does not save the link' do
        expect {
          post :create, failing_params 
          }.to_not change(Link, :count)
      end
      
      it 'renders the "new" template' do
        post :create, failing_params
        response.should be_success
        response.should render_template('new')
      end
    end
end
