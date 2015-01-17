Rails.application.routes.draw do
	resources :documents, only: :show
	resources :sessions, only: [:create, :index, :destroy]
	resources :blocks, only: [:create, :update, :destroy]
	resources :snippets, only: [:create, :update, :destroy]
	resources :pages, only: [:create,:destroy]
end
