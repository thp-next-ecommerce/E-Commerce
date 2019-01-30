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

FactoryBot.define do
  factory :item do
    name { Faker::WorldOfWarcraft.hero }
    description { Faker::WorldOfWarcraft.quote }
    has_discount { false }
    original_price { 1.5 }
    discounted_percentage { 1 }
  end
end
