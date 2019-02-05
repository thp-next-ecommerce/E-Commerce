# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:order_status) { create(:in_progress_status) }
  let(:order) { create(:order) }

  describe "POST #create" do
    subject(:create_charge) { post :create, params: { id: order.id } }

    let(:customer) { instance_double("Stripe::Customer.create") }

    before do
      order_status
    end

    context "when the Stripe charge has been created," do
      it "redirects to orders#close" do
        allow(Stripe::Customer).to receive(:create).and_return(customer)
        allow(customer).to receive(:id)
        allow(Stripe::Charge).to receive(:create)
        expect(create_charge).to have_http_status(:redirect)
      end
    end
  end
end
