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

class Edition < ApplicationRecord
  has_many :items, dependent: :destroy
end
