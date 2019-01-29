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

FactoryBot.define do
  factory :order_item do
    item
    order
    unit_price { "9.99" }
    quantity { 1 }
    total_price { "9.99" }
  end
end
