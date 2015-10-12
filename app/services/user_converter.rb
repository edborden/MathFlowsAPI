class UserConverter

  def initialize user,google
    @user = user
    @google = google
  end
  
  def from_guest
    set_user_attrs
    UservoiceHandler.new(@user).handle :set_uservoice_token 
    invitation.set_signup(@user) if invitation
    @user.save
    set_google
    adjust_plan
    MailchimpHandler.new.handle :subscribe, @user
    MailHandler.new.handle :welcome, @user
    KeenHandler.new.handle :publish,:signup, {user:@user,invitation:invitation}
    send_all_groupvitations
    return @user
  end

  def set_user_attrs
    userinfo = @google.userinfo
    @user.name = userinfo.name
    @user.email = userinfo.email
    @user.gender = userinfo.gender
    @user.pic = userinfo.picture
  end

  def set_google
    GoogleAuth.create user_id:@user.id,google_id: @google.userinfo.id,link: @google.userinfo.link,refresh: @google.authorization.refresh_token
  end

  def invitation
    @invitation ||= Invitation.find_by_referral_email @user.email
  end

  def send_all_groupvitations
    groupvitations = Groupvitation.where(receiver_email: @user.email)
    groupvitations.each do |groupvitation| 
      groupvitation.receiver_id = @user.id
      groupvitation.send_groupvitation_email
    end
  end

  def adjust_plan
    plan = @user.plan
    plan.basic!
    plan.save
  end

end