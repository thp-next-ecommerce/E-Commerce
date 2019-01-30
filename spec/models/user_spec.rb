# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:new_user) { described_class.new }

  let(:user) { create(:user) }

  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(default: '', null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: '', null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe "Associations" do
    it { is_expected.to have_one(:profile) }
  end

  describe 'unit test validation' do
    it 'is creatable' do
      expect(user.id).not_to be_nil
    end
    it 'is confirmable' do
      user.confirm
      expect(user.confirmed_at).not_to be_nil
    end
    it 'is valid with valid attibutes' do
      expect(user).to be_valid
    end
    it 'is not valid without attibutes' do
      expect(new_user).not_to be_valid
    end
  end
end
