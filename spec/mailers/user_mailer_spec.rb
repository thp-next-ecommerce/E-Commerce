# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  subject { create(:user) }

  describe 'UserMailer' do
    it 'send welcome_email after user creation' do
      email = UserMailer.welcome_email(subject)
      assert_emails 1 do
        email.deliver_now
      end
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
    it 'sends the confirmation email at user_creation' do
      user = User.create(email: "test@gmail.com", password: "password")
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      #active_for_authentication?
    end
  end

  describe 'welcome_email UserMailer' do
    it 'checks email' do
      email = UserMailer.welcome_email(subject)
      assert_emails 1 do
        email.deliver_now
      end
      assert_equal [subject.email], email.to
      assert_equal ["hello@magic-store.com"], email.from
      assert_equal "Welcome to the Magic Store", email.subject
    end
  end
end
