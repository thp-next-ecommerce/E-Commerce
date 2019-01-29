# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  description           :text
#  has_discount          :boolean          default(FALSE)
#  original_price        :decimal(12, 2)
#  discounted_percentage :integer
#  active                :boolean          default(TRUE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validation and association' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:original_price).of_type(:decimal).with_options(precision: 12, scale: 2) }
    it { is_expected.to have_db_column(:active).of_type(:boolean).with_options(default: true) }
  end
end