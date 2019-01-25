class Card < ApplicationRecord
  has_one :stock
  belongs_to :edition
end
