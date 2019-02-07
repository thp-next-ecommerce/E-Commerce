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
    it "doesn't show the 'Ajouter au panier' button" do
      render
      expect(rendered).not_to include 'Ajouter au panier'
    end

    it "doesn't show the 'Ajouté' button" do
      render
      expect(rendered).not_to include 'Ajouté'
    end
  end

  context "when a user IS logged in," do
    before do sign_in create(:user) end

    it "shows the 'Ajouter au panier' button when the item is not in the cart" do
      render
      expect(rendered).to include 'Ajouter au panier'
    end

    it "changes the cart button to 'Ajouté' when item is already in cart" do
      assign(:order_item, create(:order_item, item: create(:item)))
      render
      expect(rendered).to include 'Ajouté'
    end
  end
end
