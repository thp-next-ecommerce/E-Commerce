# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ItemsController, type: :controller do
  let(:item) { create(:item) }
  let(:admin) { create(:admin) }
  let(:params) { { id: item.id, item: attributes_for(:item_with_discount) } }
  let(:wrong_params) { { id: item.id, item: attributes_for(:item_wrong_data) } }

  before do
    sign_in admin
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
      get :show, params: { id: item.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'returns http_success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: item.id }
    end

    it 'returns http_success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    context "with good data" do
      it 'update the item and success' do
        patch :update, params: params
        item.reload
        expect(response).to redirect_to(administration_items_path)
      end
    end

    context "with wrong data" do
      it 'does not redirect_to' do
        patch :update, params: wrong_params
        item.reload
        expect(response).to redirect_to(administration_items_path)
      end
      it 'does not update item' do
        patch :update, params: wrong_params
        item.reload
        expect(item.discounted_percentage).not_to eq(200)
      end
      it 'set a flash alert' do
        patch :update, params: wrong_params
        item.reload
        expect(controller).to set_flash[:alert]
      end
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

  describe 'admin' do
    it 'can create an item' do
      expect(item.id).not_to be_nil
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http_success' do
      item.destroy
      expect(response.status).to eq 200
    end
  end
end
