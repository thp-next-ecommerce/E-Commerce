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
  subject(:item) { create(:item_without_discount) }

  let(:new_item) { build_stubbed(:item) }

  describe 'database' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false, presence: true) }
    it { is_expected.to have_db_column(:original_price).of_type(:decimal).with_options(precision: 12, scale: 2) }
    it { is_expected.to have_db_column(:active).of_type(:boolean).with_options(default: true) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association' do
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_one(:stock) }
  end

  it 'is creatable' do
    expect(item.id).not_to be_nil
  end

  describe 'validation' do
    it 'is not valid with discounted_percentage > 100' do
      new_item.discounted_percentage = 200
      expect(new_item).not_to be_valid
    end
    it 'is not valid with a negative discount' do
      new_item.discounted_percentage = -20
      expect(new_item).not_to be_valid
    end
    it 'is valid with a discout between 0 and 100' do
      new_item.discounted_percentage = 50
      expect(new_item).to be_valid
    end
    it 'is not valid with a name shorter than 3 caracters' do
      new_item.name = 't'
      expect(new_item).not_to be_valid
    end
    it 'is not valid with original_price to nil' do
      new_item.original_price = nil
      expect(new_item).not_to be_valid
    end
  end

  describe '.price' do
    it 'matches price.item ' do
      item.original_price = 20
      item.save
      item.reload
      expect { item.update(discounted_percentage: 50, has_discount: true) }.to change(item, :price).from(20).to(10)
    end
  end
end
