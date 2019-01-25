# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    subtotal { "9.99" }
    tax { "9.99" }
    shipping { "9.99" }
    total { "9.99" }
    order_status { nil }
  end
end
