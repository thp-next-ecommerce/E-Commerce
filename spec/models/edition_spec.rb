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

require 'rails_helper'

RSpec.describe Edition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
