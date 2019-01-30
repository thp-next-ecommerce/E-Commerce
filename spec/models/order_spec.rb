# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id              :bigint(8)        not null, primary key
#  subtotal        :decimal(12, 2)
#  tax             :decimal(12, 2)
#  shipping        :decimal(12, 2)
#  total           :decimal(12, 2)
#  order_status_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { build_stubbed(:order) }

  describe "model instanciation," do
    describe 'database' do
      it { is_expected.to have_db_column(:subtotal).of_type(:decimal) }
      it { is_expected.to have_db_column(:tax).of_type(:decimal) }
      it { is_expected.to have_db_column(:shipping).of_type(:decimal) }
      it { is_expected.to have_db_column(:total).of_type(:decimal) }
      it { is_expected.to have_db_column(:order_status_id).of_type(:integer) }
    end

    describe 'association' do
      let(:created_order) { create(:order) }

      it { is_expected.to belong_to(:order_status) }
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:order_items) }

      it 'follows a relational link through order_status model up to itself' do
        expect(created_order.order_status.orders.first).to be_truthy
      end

      it 'follows a relational link through user model up to itself' do
        expect(created_order.user.orders.first).to be_truthy
      end
    end

    it 'is creatable' do
      expect(order.id).not_to be_nil
    end
  end

  describe 'method' do
    describe '#subtotal' do
      skip
    end
  end
end
