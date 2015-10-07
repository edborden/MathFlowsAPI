class Visit

  def initialize invitation

    invitation.visited!
    invitation.save
    KeenHandler.new.handle :publish,:invitation_visit, invitation

  end

end