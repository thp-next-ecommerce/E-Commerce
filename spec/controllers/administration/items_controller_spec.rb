# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ItemsController, type: :controller do
  let(:item) { create(:item) }
  describe '.delete_item' do
    it 'gets alert' do
      skip
      delete_item(item)
      it { is_expected.to set_the_flash(:notice).to('Product has been deleted successfuly') }
    end
  end
end
