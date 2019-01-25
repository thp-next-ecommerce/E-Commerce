# frozen_string_literal: true

class Card < ApplicationRecord
  has_one :stock, dependent: :destroy
  belongs_to :edition
end
