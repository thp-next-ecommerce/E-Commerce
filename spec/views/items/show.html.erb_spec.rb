# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "items/show.html.erb", type: :view do
  let(:in_progress_status) { create(:order_status, :in_progress) }

  before do
    in_progress_status
    assign(:item, create(:item))
    assign(:order_item, build(:order_item))
  end

  context "when a user is NOT logged in," do
    it "does show the 'Ajouté' button" do
      render
      expect(rendered).to include 'Se connecter'
    end
  end

  context "when a user IS logged in," do
    before do sign_in create(:user) end

    it "shows the 'Ajouter au panier' button when the item is not in the cart" do
      render
      expect(rendered).to include 'Ajouter au panier'
    end

    it "displays 2 buttons when item is already in cart" do
      assign(:order_item, create(:order_item, item: create(:item)))
      render
      expect(rendered).to include 'Retour au shop'
      expect(rendered).to include 'Finaliser votre commande'
    end
  end
end
