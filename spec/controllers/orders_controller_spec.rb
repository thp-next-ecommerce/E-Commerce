# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:in_progress_status) { create(:in_progress_status) }
  let(:order) { create(:order) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      in_progress_status
      get :show, params: { id: order.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #close (after Stripe charge)" do
    subject(:close_order_request) { post :close, params: { id: order.id } }
    
    let(:placed_status) { create(:order_status, :placed) }
    
    before do 
      in_progress_status 
      placed_status
      session[:order_id] = order.id
    end
    
    it "returns http success" do
      expect(close_order_request).to have_http_status(:success)
    end
    
    it "changes the status of an Order to 'Confirmé'" do
      close_order_request
      order.reload
      expect(order.order_status.name).to eq "Confirmé"
    end
    
    it "emptyes the basket" do
      close_order_request
      current_order =  controller.view_context.current_order 
      expect(current_order).to_not eq order.reload
    end
  end
end
