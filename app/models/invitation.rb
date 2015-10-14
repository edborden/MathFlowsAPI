class Invitation < ActiveRecord::Base
  validates_uniqueness_of :referral_email
  validates_presence_of :referral_email,:referrer_id

  belongs_to :referrer, class_name: "User"
  belongs_to :referral, class_name: "User"

  enum status: [:sent,:visited,:signed_up]

  after_create :send_invitation_email

  def send_invitation_email
    MailHandler.new.handle :invitation, self
    KeenHandler.new.handle :publish,:invitation, { invitation: self, referrer: referrer }   
  end

  def set_signup referral
    self.referral_id = referral.id
    signed_up!
    save

    referrer.tests_quota += 5
    referrer.save

    referral.referred_by = referrer.name
    referral.tests_quota += 5
    referral.save

    MailHandler.new.handle :invitation_signup, self
    KeenHandler.new.handle :publish,:invitation_signup, { invitation: self, referrer: referrer, referral:referral }
  end

  def set_owner user
    self.referrer_id = user.id
  end

end