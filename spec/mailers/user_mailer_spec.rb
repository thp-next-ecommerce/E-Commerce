require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  subject(:user) { create(:user) }

  describe 'user creation confirmation' do
    it 'returns valid status after creation' do
      expect(subject).to be_valid
    end
    it 'checks the confirmed status' do
      expect(subject.confirmed?).to be false 
    end
    it 'checks the pending status' do
      expect(subject.confirmed?).to be false
    end
    it 'updates confirmation_sent_at' do
      expect(subject.confirmation_sent_at).to be_truthy
    end
    it 'send an email to user' do 
      skip
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
    it 'checks number of days before confirmation' do 
      skip
      active_for_authentication?
    end
  end

  describe 'welcome_email' do
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
