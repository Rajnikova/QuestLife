Rails.application.routes.draw do
  get 'login/new'
  get 'quests/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',     to: 'login#new'
  post   '/login',     to: 'login#create'
  delete '/logout',    to: 'login#destroy'
  get    '/quests',    to: 'quests#index'
  patch  '/quests',    to: 'quests#complete'
  post   '/quests',    to: 'quests#complete'
  post   '/allquests', to: 'allquests#new'
  resources :quests do
    post :accept
  end
  resources :users
  resources :index
  resources :login
  resources :allquests do
    post :accept
  end
end

