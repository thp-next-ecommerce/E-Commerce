# frozen_string_literal: true

class Card < ApplicationRecord
  has_one :stock, dependent: :destroy
  belongs_to :edition
  has_many :order_items

  default_scope { where(active: true) }
end
