class Profile < ApplicationRecord
	belongs_to :user
	has_one :user
	has_one :adress
end
