Rails.application.routes.draw do

	resources :sessions, only: [:create, :index, :destroy]
	

end
