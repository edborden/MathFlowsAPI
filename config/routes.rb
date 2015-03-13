Rails.application.routes.draw do
	resources :students, only: [:create,:update,:destroy]
	resources :documents, only: [:create,:show,:update,:destroy]
	resources :sessions, only: [:create, :index, :destroy]
	resources :blocks, only: [:show, :update, :destroy]
	resources :images, only: [:create, :destroy]
	resources :pages, only: [:create,:show,:destroy]
	resources :folders, only: [:create,:update,:destroy]
	resources :flows, only: [:create,:update,:destroy]
	resources :positions, only: [:create,:update]
	resources :groups, only: [:create,:update,:destroy]
	resources :invitations, only: [:create,:show,:update]
end