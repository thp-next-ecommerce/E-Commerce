# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id          :bigint(8)        not null, primary key
#  item_id     :bigint(8)
#  order_id    :bigint(8)
#  unit_price  :decimal(12, 2)
#  quantity    :integer
#  total_price :decimal(12, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "model instanciation," do
    describe "database" do
      it { is_expected.to have_db_column(:item_id).of_type(:integer) }
      it { is_expected.to have_db_column(:order_id).of_type(:integer) }
      it { is_expected.to have_db_column(:unit_price).of_type(:decimal) }
      it { is_expected.to have_db_column(:quantity).of_type(:integer) }
      it { is_expected.to have_db_column(:total_price).of_type(:decimal) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:quantity) }
      it { is_expected.to validate_numericality_of(:quantity).only_integer }
    end

    describe "association" do
      let(:order_status) { create(:in_progress_status) }
      let(:order_item) { create(:order_item) }

      # Bug: need to refresh variable to make order_status accessible
      before do
        order_status
      end

      it { is_expected.to belong_to(:item) }
      it { is_expected.to belong_to(:order) }

      it "follows the relational link to `item`" do
        expect(order_item.item).to be_truthy
      end

      it "follows the relational link to `order`" do
        expect(order_item.order).to be_truthy
      end

      it "follows the relational link to itself through`item`" do
        expect(order_item.item.order_items.first).to be_truthy
      end

      it "follows the relational link to itself through `order`" do
        # order_items are not automatically assigned to Orders on order_item creation
        order_item.order.order_items << order_item
        expect(order_item.order.order_items.first).to be_truthy
      end
    end
  end

  describe "model method" do
    let(:order_status) { create(:in_progress_status) }
    let(:item) { build(:item) }
    let(:o_i) { build(:order_item, item: item) }

    # Bug: need to refresh variable to make order_status accessible
    before do
      order_status
    end

    describe "#unit_price" do
      it "returns the same price as Item#price" do
        expect(o_i.unit_price).to eq item.price
      end

      it "returns 0 if the #price == 0" do
        item.original_price = 0
        expect(o_i.unit_price).to eq 0
      end
    end

    describe "#total_price" do
      it "behaves as expected" do
        o_i.quantity = 5
        expect(o_i.total_price).to eq(item.price * 5)
      end
    end
  end
end
