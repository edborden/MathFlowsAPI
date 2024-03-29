Rails.application.routes.draw do
  resources :tests, only: [:create,:show,:update,:destroy]
  post 'tests/:id/copy', to: 'tests#copy'  
  resources :sessions, only: [:create, :index, :destroy]
  resources :blocks, only: [:create,:update,:destroy]
  post 'blocks/:id/validate', to: 'blocks#validate'
  post 'blocks/:id/copy', to: 'blocks#copy'
  resources :images, only: [:create, :update, :destroy]
  resources :pages, only: [:create,:show,:destroy]
  resources :folders, only: [:create,:update,:destroy]
  resources :groups, only: [:create,:update]
  post 'groups/unjoin', to: 'groups#unjoin'
  resources :invitations, only: [:create]
  post 'invitations/:id/visit', to: 'invitations#visit'
  resources :lines, only: [:create,:update,:destroy]
  resources :metrics, only: :index
  get 'metrics/ten', to: 'metrics#ten'
  resources :preferences, only: :update
  resources :groupvitations, only: [:create,:destroy]
  post 'groupvitations/:id/accept', to: 'groupvitations#accept'
  post 'groupvitations/:id/decline', to: 'groupvitations#decline'
  resources :tables, only: [:create,:destroy]
  resources :cells, only: [:create]
  resources :projections, only: [:create,:update,:destroy]
  resources :alignments, only: [:update]
  resources :invalidations, only: :index
  resources :styles, only: [:create,:destroy]
end