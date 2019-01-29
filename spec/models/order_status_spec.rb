# frozen_string_literal: true

# == Schema Information
#
# Table name: order_statuses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe OrderStatus, type: :model do
  describe "database" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe "validation" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "associations" do
    let(:order) { create(:order) }
    let(:order_status) { create(:order_status) }

    it { is_expected.to have_many(:orders) }

    it "follows the relational link to its `orders`" do
      expect(order_status.orders).to be_truthy
    end

    it "follows the relational link to itself through `orders`" do
      order_status.orders << order
      expect(order_status.orders.first.order_status).to be_truthy
    end
  end
end
