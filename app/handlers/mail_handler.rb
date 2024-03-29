class MailHandler < MandrillMailer::TemplateMailer
  
  default from: "support@mathflows.com"
  default from_name: "MathFlows"

  def handle command,*args
    return
  end

  def welcome user
    mandrill_mail( template: 'welcome',
      subject: "Welcome to MathFlows",
      to: {email: user.email, name: user.name},
      important: true,
      inline_css: true,
      async: true
    ).deliver
  end

  def invitation invitation
    mandrill_mail( template: 'invitation',
      subject: "#{invitation.referrer.name} invited you to MathFlows",
      to: invitation.referral_email,
      important: true,
      inline_css: true,
      vars: {'REFERRER_NAME' => invitation.referrer.name, 'INVITATION_ID' => invitation.id},
      async: true
    ).deliver
  end

  def invitation_signup invitation
    mandrill_mail( template: 'invitation-signup',
      subject: "Your friend joined MathFlows!",
      to: invitation.referrer.email,
      important: true,
      inline_css: true,
      vars: {'REFERRAL_NAME' => invitation.referral.name},
      async: true
    ).deliver
  end

  def groupvitation groupvitation
    mandrill_mail( template: 'groupvitation',
      subject: "#{groupvitation.sender.name} invited you their MathFlows group",
      to: groupvitation.receiver_email,
      important: true,
      inline_css: true,
      vars: {'SENDER_NAME' => groupvitation.sender.name, 'GROUP_NAME' => groupvitation.sender.group.name},
      async: true
    ).deliver
  end

  def tips1 user
    mandrill_mail( template: 'tips1',
      subject: "Type math inline as easy as text",
      to: user.email,
      important: true,
      inline_css: true,
      async: true,
      send_at: Time.now + 1.day
    ).deliver
  end

end