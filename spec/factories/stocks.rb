FactoryBot.define do
  factory :stock do
    available { 1 }
    on_hold { 1 }
    sold { 1 }
    shipped { 1 }
    card { nil }
  end
end
