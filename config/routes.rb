Rails.application.routes.draw do
  get 'login/new'
  get 'quests/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post   '/sign_up',        to: 'sign_up#create'
  get    '/login',          to: 'login#new'
  post   '/login',          to: 'login#create'
  delete '/login',          to: 'login#logout'
  delete '/logout',         to: 'login#destroy'
  get    '/quests',         to: 'quests#index'
  patch  '/quests',         to: 'quests#complete'
  post   '/quests',         to: 'quests#complete'
  get    '/allquests',      to: 'allquests#index'
  post   '/allquests',      to: 'allquests#new'
  put    '/allquests',      to: 'allquests#add_to_room'
  get    '/quest_detail',   to: 'quest_detail#index'
  get    '/created_quests', to: 'created_quests#index'
  delete '/created_quests', to: 'created_quests#delete'
  post   '/created_quests', to: 'created_quests#index'
  delete '/new_quests',     to: 'new_quests#delete'
  get    '/new_quests',     to: 'new_quests#index'
  post   '/new_quests',     to: 'new_quests#new'
  get    '/rooms',          to: 'rooms#index'
  get    '/room_detail',    to: 'room_detail#index'
  post   '/room_detail',    to: 'room_detail#join'
  delete '/room_detail',    to: 'room_detail#leave'
  get    '/create_room',    to: 'create_room#index'
  get    '/admin_rooms',    to: 'admin_rooms#index'
  put    '/admin_rooms',    to: 'admin_rooms#add_to_room'
  get    '/home',           to: 'home#index'

  resources :quests do
    post :accept
  end
  resources :users
  resources :index
  resources :login
  resources :sign_up
  resources :home
  resources :quest_detail
  resources :created_quests
  resources :new_quests
  resources :rooms
  resources :room_detail
  resources :create_room
  resources :allquests do
    post :accept
  end
  Rails.application.routes.draw do
    root 'home#index'
  end
end

