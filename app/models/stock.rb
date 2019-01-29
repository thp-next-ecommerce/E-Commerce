# frozen_string_literal: true

# == Schema Information
#
# Table name: stocks
#
#  id         :bigint(8)        not null, primary key
#  available  :integer
#  on_hold    :integer
#  sold       :integer
#  shipped    :integer
#  item_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
  belongs_to :item
end
