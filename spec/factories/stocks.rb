# frozen_string_literal: true

# == Schema Information
#
# Table name: stocks
#
#  id         :bigint(8)        not null, primary key
#  available  :integer
#  on_hold    :integer
#  sold       :integer
#  shipped    :integer
#  card_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :stock do
    available { 1 }
    on_hold { 1 }
    sold { 1 }
    shipped { 1 }
    card { nil }
  end
end
