require File.dirname(__FILE__) + '/../spec_helper'

describe AuthenticationsController do
  before (:each) do
    @authentication = Factory(:authentication)
    @user = Factory(:user)
    sign_in @user
  end
  render_views

  it "destroy action should destroy model and redirect to index action" do
    authentication = @authentication
    delete :destroy, :id => authentication
    response.should redirect_to(profile_url)
    Authentication.exists?(authentication.id).should be_false
  end
end
