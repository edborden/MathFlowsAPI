class Visit

  def initialize invitation

    invitation.status = "visited"
    invitation.save
    KeenHandler.new.handle :publish,:invitation_visit, invitation

  end

end