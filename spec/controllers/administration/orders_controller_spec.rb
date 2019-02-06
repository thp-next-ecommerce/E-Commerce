# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::OrdersController, type: :controller do
  let(:status) { create(:in_progress_status) }
  let(:placed_status) { create(:with_placed_status) }
  let(:order) { create(:order) }
  let(:order_item) { create(:order_item, order: order) }
  let(:params) { { id: order.id, order: attributes_for(:placed_order) } }
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }

  before do
    sign_in admin
    status
    placed_status
    order
    order.order_items << order_item
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: order.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update status' do
    it 'returns http_success' do
      patch :update, params: { id: order.id, order: { order_status_id: 2 } }
      order.reload
      expect(response).to redirect_to(administration_orders_path)
    end
  end

  describe "when admin is logged_out" do
    before do
      sign_out admin
      get :index
    end

    it 'redirects to admin sign_in' do
      expect(response).to redirect_to(new_admin_session_path)
    end
  end
end
