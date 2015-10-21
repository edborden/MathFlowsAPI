class PreferencesController < ResourceController

  def resource_params
    params.require(:preference).permit :borders,:directions,:tour,:group_help,:me_group_help,:me_test_help
  end

end
