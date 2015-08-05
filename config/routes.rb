Rails.application.routes.draw do
	resources :students, only: [:create,:update,:destroy]
	resources :tests, only: [:create,:show,:update,:destroy]
	resources :sessions, only: [:create, :index, :destroy]
	resources :blocks, only: [:create,:update,:show,:destroy]
	resources :images, only: [:create, :destroy]
	resources :pages, only: [:create,:show,:destroy]
	resources :folders, only: [:create,:update,:destroy]
	resources :groups, only: [:create,:update]
	post 'groups/unjoin', to: 'groups#unjoin'
	resources :invitations, only: [:create,:show,:update]
	resources :lines, only: [:create,:update,:destroy]
	resources :metrics, only: :index
	resources :preferences, only: :update
	resources :groupvitations, only: [:create,:destroy]
	post 'groupvitations/:id/accept', to: 'groupvitations#accept'
	post 'groupvitations/:id/decline', to: 'groupvitations#decline'
end