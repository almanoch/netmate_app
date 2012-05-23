require 'spec_helper'

describe "Micromessage pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "micromessage creation" do
    before { visit root_path }
    
    describe "with invalid informaion" do
      
      it "should not create a micromessage" do
        expect { click_button "Post" }.should_not change(Micromessage, :count)
      end
      
      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      
      before { fill_in 'micromessage_content', with: "Lorem ipsum" }
      it "should create a micromessage" do
        expect { click_button "Post" }.should change(Micromessage, :count).by(1)
      end
    end
  end
  
  describe "micromessage destruction" do
    before { FactoryGirl.create(:micromessage, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a micromessage" do
        expect { click_link "delete" }.should change(Micromessage, :count).by(-1)
      end
    end
  end
end
