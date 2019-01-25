# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    name { "MyString" }
    color { "MyString" }
    rarity { "MyString" }
    text { "MyText" }
    type { "" }
    premium { false }
    has_discount { false }
    original_price { 1.5 }
    discrounted_percentage { 1 }
    edition { nil }
  end
end
