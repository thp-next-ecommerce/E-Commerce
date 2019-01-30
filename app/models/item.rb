# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  description           :text
#  has_discount          :boolean          default(FALSE)
#  original_price        :decimal(12, 2)
#  discounted_percentage :integer
#  active                :boolean          default(TRUE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Item < ApplicationRecord
  has_one :stock, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :original_price, presence: true, allow_nil: false
  validates :has_discount, default: false
  validates :discounted_percentage,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
            
  default_scope { where(active: true) }
  scope :sorted_by_price, -> { order("original_price ASC") }
  scope :sorted_by_name, lambda { order("name ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :with_discount, lambda { where(has_discount: true) }
  scope :without_discount, lambda { where(has_discount: false) }

  def price
    has_discount ? (original_price.to_i * (1 - discounted_percentage.to_f / 100)).round(2) : original_price.to_i
  end
end
