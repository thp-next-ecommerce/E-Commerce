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

class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :nullify
  validates :name, presence: true
end
