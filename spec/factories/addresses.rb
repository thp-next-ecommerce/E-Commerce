# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :bigint(8)        not null, primary key
#  street_name_1 :string
#  street_name_2 :string
#  city          :string
#  post_code     :integer
#  country       :string
#  profile_id    :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


FactoryBot.define do
  factory :address do
    street_name_1 { "MyString" }
    street_name_2 { "MyString" }
    city { "MyString" }
    post_code { 1 }
    country { "MyString" }
    profile { nil }
  end
end
