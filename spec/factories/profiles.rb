# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    phone { "MyString" }
    birth_date { "2019-01-24" }
  end
end
