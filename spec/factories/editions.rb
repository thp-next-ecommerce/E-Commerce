# frozen_string_literal: true

# == Schema Information
#
# Table name: editions
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  release_date :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :edition do
    name { "MyString" }
    release_date { "2019-01-25 14:27:13" }
  end
end
