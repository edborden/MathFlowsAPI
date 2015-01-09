Rails.application.routes.draw do

	resources :sessions, only: [:create, :index, :destroy]
	resources :layouts, only: [:create, :show, :destroy]
	resources :blocks, only: [:create, :update, :destroy]
	resources :snippets, only: [:create, :update, :destroy]
end
