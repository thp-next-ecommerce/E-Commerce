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

  default_scope { where(active: true) }
  validates :name, presence: true

  def price
    has_discount ? (original_price.to_i * (1 - discounted_percentage.to_f / 100)).round(2) : original_price.to_i
  end
end
