# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  subject(:user) { create(:user) }

  describe 'user creation confirmation' do
    it 'send an email to user' do
      skip
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
    it 'checks number of days before confirmation' do
      skip
      active_for_authentication?
    end
  end

  describe 'welcome_email UserMailer' do
    it 'checks email' do
      email = UserMailer.welcome_email(user)
      assert_emails 1 do email.deliver_now end
      assert_equal [user.email], email.to
      assert_equal ["hello@magic-store.com"], email.from
      assert_equal "Welcome to the Magic Store", email.subject
    end
  end
end
