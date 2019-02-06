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
    trait :in_progress do
      id { 1 }
      name { "En cours" }
    end

    trait :placed do
      id { 2 }
      name { "Confirmé" }
    end

    trait :shipped do
      id { 3 }
      name { "Envoyé" }
    end

    trait :cancelled do
      id { 4 }
      name { "Annulé" }
    end

    factory :in_progress_status, traits: [:in_progress]
    factory :with_placed_status, traits: [:placed]
  end
end
