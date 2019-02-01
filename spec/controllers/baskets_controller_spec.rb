# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketsController, type: :controller do
  describe "GET #show" do
    let(:user) { create(:user) }

    it "returns http success when logged in" do
      sign_in user
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect if not logged in" do
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end
end
