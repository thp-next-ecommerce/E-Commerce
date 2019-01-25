class Edition < ApplicationRecord
  has_many :cards, dependent: :destroy
end
