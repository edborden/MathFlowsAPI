class PreferencesController < ResourceController

  def resource_params
    params.require(:preference).permit :borders,:directions,:tour,:group_help
  end

end
