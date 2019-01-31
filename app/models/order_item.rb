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

#  An OrderItem totalizes the price and quantity for one Item. It will be used
#  in an Order
class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :item_present?
  validate :order_present?

  before_save :finalize

  def unit_price
    return self[:unit_price] if persisted?

    item.price
  end

  def total_price
    unit_price * quantity
  end

  private

  def item_present?
    errors.add(:item, "is not valid or inactive") if item.nil?
  end

  def order_present?
    errors.add(:order, "is not a valid order") if order.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
