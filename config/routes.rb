Rails.application.routes.draw do
	resources :documents, only: [:create,:show,:destroy]
	resources :sessions, only: [:create, :index, :destroy]
	resources :blocks, only: [:create, :show, :update, :destroy]
	resources :snippets, only: [:create, :update, :destroy]
	resources :pages, only: [:create,:show,:destroy]
	resources :folders, only: [:create,:update,:destroy]
	resources :flows, only: [:create,:update,:destroy]
end
