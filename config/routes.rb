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
  patch  '/home',           to: 'home#set_locale'
  get    '/about',          to: 'about#index'
  get    '/create_quest',   to: 'create_quest#index'
  get    '/users',          to: 'users#index'
  put    '/users',          to: 'users#make_admin'
  get    '/index',          to: 'index#index'

  resources :quests do
    post :accept
  end
  resources :users
  resources :create_quest
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
  scope "(:locale)", :locale => /en|sk/ do
    root :to => 'page#index'
    get "page/index"
  end
end

