Rails.application.routes.draw do

	resources :sessions, only: [:create, :index, :destroy]
	resources :grids, only: [:create, :destroy]
	resources :layouts, only: [:create, :update, :destroy]

end
