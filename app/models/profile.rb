# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
  has_many :orders
end
