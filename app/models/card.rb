# frozen_string_literal: true
# == Schema Information
#
# Table name: cards
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  color                 :string
#  rarity                :string
#  text                  :text
#  type                  :string
#  premium               :boolean
#  has_discount          :boolean
#  original_price        :decimal(12, 2)
#  discounted_percentage :integer
#  edition_id            :bigint(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  active                :boolean
#

class Card < ApplicationRecord
  has_one :stock, dependent: :destroy
  belongs_to :edition
  has_many :order_items

  default_scope { where(active: true) }
end
