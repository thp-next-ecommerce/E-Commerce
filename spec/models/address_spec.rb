# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :bigint(8)        not null, primary key
#  street_name_1 :string
#  street_name_2 :string
#  city          :string
#  post_code     :integer
#  country       :string
#  profile_id    :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:street_name_1).of_type(:string) }
    it { is_expected.to have_db_column(:street_name_2).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:postal_code).of_type(:integer) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end
end
