# frozen_string_literal: true

class Edition < ApplicationRecord
  has_many :cards, dependent: :destroy
end
