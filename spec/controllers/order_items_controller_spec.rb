# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:status) { create(:in_progress_status) }
  let(:order) { create(:order) }
  let(:order_item) { create(:order_item, order: order) }
  let(:params) { { id: order_item.id, order_item: attributes_for(:order_item) } }

  before do
    status
    session[:order_id] = order.id
    order.order_items << order_item
  end

  describe "POST #create" do
    it "returns http success with 'order_item[quantity]' and 'order_item_id' in params" do
      post :create, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: params
      expect(response).to have_http_status(:success)
    end
  end
end
