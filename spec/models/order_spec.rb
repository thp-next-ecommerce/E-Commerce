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
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { build(:order) }

  describe 'database and association' do
    it { is_expected.to have_db_column(:subtotal).of_type(:decimal) }
    it { is_expected.to have_db_column(:tax).of_type(:decimal) }
    it { is_expected.to have_db_column(:shipping).of_type(:decimal) }
    it { is_expected.to have_db_column(:total).of_type(:decimal) }
    it { is_expected.to have_db_column(:order_status_id).of_type(:integer) }
    it { is_expected.to belong_to(:order_status) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:order_items) }
  end

  # describe 'assocociation' do
  #   it 'follows a relational link through order_status model up to itself' do
  #     order = create(:order).reload
  #     expect(order.order_status.orders.first).to eq order
  #   end
  #   it 'follows a relational link through user model up to itself' do
  #     order = create(:order).reload
  #     expect(order.user.orders.first).to eq order
  #   end
  # end

  # it 'is creatable' do
  #   order = create(:order).reload
  #   expect(order.id).not_to be_nil
  # end
end
