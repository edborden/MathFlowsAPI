class SessionsController < AuthenticatedController
  skip_before_action :ensure_authenticated_user, only: :create

  def create
    if params[:session][:token] == "issue"
      user = GuestUser.new.user
      user.facebook_referrer = params[:session][:facebook_referrer]
      user.google_referrer = params[:session][:google_referrer]
      user.kickstarter_referrer = params[:session][:kickstarter_referrer]
      user.save
    else 
      google = GoogleHandler.new.user_authorized(params[:session][:token],params[:session][:redirect_uri])
      user = GoogleAuth.find_by_google_id(google.userinfo.id).try :user
      unless user
        user_to_convert = current_user || GuestUser.new.user
        user = UserConverter.new(user_to_convert,google).from_guest
      end
      user.session.try :destroy
    end
    @current_user = user #make scope available to serializers
    render json: user.create_session
  end

  def index
    render json: [current_session]
  end

  def destroy
    current_session.destroy
    head :no_content
  end

end
