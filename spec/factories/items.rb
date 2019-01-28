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

FactoryBot.define do
  factory :card do
    name { "MyString" }
    description { "MyText" }
    has_discount { false }
    original_price { 1.5 }
    discounted_percentage { 1 }
    edition { nil }
  end
end
