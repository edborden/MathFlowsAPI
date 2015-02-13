Rails.application.routes.draw do
	resources :documents, only: [:create,:show,:destroy]
	resources :sessions, only: [:create, :index, :destroy]
	resources :blocks, only: [:show, :destroy]
	resources :snippets, only: [:create, :update, :destroy]
	resources :pages, only: [:create,:destroy]
	resources :folders, only: [:create,:update,:destroy]
	resources :flows, only: [:create,:update,:destroy]
	resources :positions, only: [:create,:update]
	resources :groups, only: [:create,:update]
end