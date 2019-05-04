Rails.application.routes.draw do
  get 'login/new'
  get 'quests/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post   '/sign_up',       to: 'sign_up#create'
  get    '/login',         to: 'login#new'
  post   '/login',         to: 'login#create'
  delete '/logout',        to: 'login#destroy'
  get    '/quests',        to: 'quests#index'
  patch  '/quests',        to: 'quests#complete'
  post   '/quests',        to: 'quests#complete'
  post   '/allquests',     to: 'allquests#new'
  get    '/quest_detail',  to: 'quest_detail#index'
  get    '/created_quests',to: 'created_quests#index'
  delete '/created_quests',to: 'created_quests#delete'
  delete '/new_quests',    to: 'new_quests#delete'
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
  resources :allquests do
    post :accept
  end
end

