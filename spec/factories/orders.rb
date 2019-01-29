# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id              :bigint(8)        not null, primary key
#  subtotal        :decimal(12, 2)
#  tax             :decimal(12, 2)
#  shipping        :decimal(12, 2)
#  total           :decimal(12, 2)
#  order_status_id :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#

FactoryBot.define do
  factory :order do
    subtotal { "9.99" }
    tax { "9.99" }
    shipping { "9.99" }
    total { "9.99" }
    user
    #  default status is "In Progress" for a new order
    order_status_id { 1 }

    trait :with_progress_status do
      association :order_status, id: 1, name: "In Progress"
    end
  end
end
