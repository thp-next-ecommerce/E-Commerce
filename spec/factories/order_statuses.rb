# frozen_string_literal: true

# == Schema Information
#
# Table name: order_statuses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order_status do
    # default status is "In Progress"
    id { 1 }
    name { "In Progress" }

    trait :placed do
      id { 2 }
      name { "Placed" }
    end

    trait :shipped do
      id { 3 }
      name { "Shipped" }
    end

    trait :cancelled do
      id { 4 }
      name { "Cancelled" }
    end
  end
end
