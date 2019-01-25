# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  address    :string
#  phone      :string
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#


FactoryBot.define do
  factory :profile do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    phone { "MyString" }
    birth_date { "2019-01-24" }
  end
end
