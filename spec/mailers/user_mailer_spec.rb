# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  subject { create(:user) }

  describe 'subject .welcome_email' do
    it 'send after user creation' do
      email = UserMailer.welcome_email(subject)
      assert_emails 1 do
        email.deliver_now
      end
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
    it 'sends the confirmation email at user_creation' do
      skip
      User.create(email: "test@gmail.com", password: "password")
      expect(ActionMailer::Base.deliveries.count).to eq(1)
      # active_for_authentication?
    end
  end

  describe 'subject .welcome_email' do
    it 'checks email content' do
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
