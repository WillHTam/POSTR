require 'rails_helper'

RSpec.describe SocializationsController, type: :controller do

  describe "GET #follow" do
    it "returns http success" do
      get :follow
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unfollow" do
    it "returns http success" do
      get :unfollow
      expect(response).to have_http_status(:success)
    end
  end

end
