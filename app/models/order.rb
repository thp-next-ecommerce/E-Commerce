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

# An Order sums the prices of associated individual OrderItems, to give the
#  total price of the desired Items
# It acts as a basket that is editable as long as the Order.new has not been #save
class Order < ApplicationRecord
  belongs_to :user

  default_scope { order({ updated_at: :desc }, :order_status_id) }
  belongs_to :order_status
  has_many :order_items, dependent: :nullify

  before_validation :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.map { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
