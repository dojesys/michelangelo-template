require File.dirname(__FILE__) + '/../spec_helper'

describe Profile do
  it "should be valid" do
    Profile.new.should be_valid
  end
end
