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

#  An in_progress_status factory must be created before any Order is created
FactoryBot.define do
  factory :order do
    user

    trait :placed_status do
      association :order_status, id: 2, name: "Placed"
    end

    factory :order_w_items do
      after(:create) do |_order|
        create_list(:order_item, 5)
      end
    end

    factory :placed_order, traits: :placed_status
  end
end
