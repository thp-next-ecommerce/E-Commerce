# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order_status) { create(:in_progress_status) }
  let(:order) { create(:order) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      order_status
      get :show, params: { id: order.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #close" do
    it "returns http success" do
      order_status
      get :close, params: { id: order.id }
      expect(response).to have_http_status(:success)
    end
  end
end
