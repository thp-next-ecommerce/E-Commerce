# frozen_string_literal: true

# == Schema Information
#
# Table name: cards
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  color                  :string
#  rarity                 :string
#  text                   :text
#  type                   :string
#  premium                :boolean
#  has_discount           :boolean
#  original_price         :float
#  discrounted_percentage :integer
#  edition_id             :bigint(8)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
