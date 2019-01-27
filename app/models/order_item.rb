# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id          :bigint(8)        not null, primary key
#  card_id     :bigint(8)
#  order_id    :bigint(8)
#  unit_price  :decimal(12, 2)
#  quantity    :integer
#  total_price :decimal(12, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :card
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
