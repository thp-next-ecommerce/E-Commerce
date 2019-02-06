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
    original_price { Faker::Number.between(1, 50) }
    discounted_percentage { Faker::Number.between(1, 80) }

    trait :without_discount do
      has_discount { false }
    end

    trait :with_discount do
      has_discount { true }
    end

    trait :wrong_data do
      has_discount { true }
      discounted_percentage { 200 }
    end

    factory :item_without_discount, traits: [:without_discount]
    factory :item_with_discount, traits: [:with_discount]
    factory :item_wrong_data, traits: [:wrong_data]
  end
end
