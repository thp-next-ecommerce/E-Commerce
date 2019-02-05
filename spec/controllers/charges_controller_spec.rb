# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:order_status) { create(:in_progress_status) }
  let(:order) { create(:order) }

  describe "POST #create" do
    subject(:create_charge) { post :create, params: { id: order.id } }

    let(:customer) { instance_double("Stripe::Customer.create") }

    context "when the Stripe charge has been created," do
      before do
        order_status
        allow(Stripe::Customer).to receive(:create).and_return(customer)
        allow(customer).to receive(:id)
        allow(Stripe::Charge).to receive(:create)
      end
      
      it { is_expected.to redirect_to(close_order_path(order.id)) }
    end
  end
end
