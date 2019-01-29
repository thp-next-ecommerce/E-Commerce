# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :bigint(8)        not null, primary key
#  street_name_1 :string
#  street_name_2 :string
#  city          :string
#  postal_code   :integer
#  country       :string
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Address < ApplicationRecord
  belongs_to :user
end
