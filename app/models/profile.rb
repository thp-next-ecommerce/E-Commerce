# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  phone      :string
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Profile < ApplicationRecord
  belongs_to :user
  has_many :addresses, dependent: :destroy
end
