# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :card
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
