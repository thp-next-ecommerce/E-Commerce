# frozen_string_literal: true

class DeleteAddressAttrToProfileModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :address, :string
  end
end
