# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
end
