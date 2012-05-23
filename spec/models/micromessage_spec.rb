require 'spec_helper'

describe Micromessage do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @micromessage = user.micromessages.build(content: "Lorem ipsum") }
  
  subject { @micromessage }
  
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Micromessage.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when user_id is not present" do
    before { @micromessage.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @micromessage.content = " " }
    it { should_not be_valid }
  end
  
  describe "with content that is too long" do
    before { @micromessage.content = "a"*141 }
    it { should_not be_valid }
  end
end
