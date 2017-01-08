Rails.application.routes.draw do
  resources :profiles
  resources :departments
  resources :companies
  # company
  get '/company-status/:id/:status', :to => 'companies#status', :as => 'company_status'
  # users
  get '/user-status/:id/:status', :to => 'profiles#status', :as => 'profile_status'
  get '/login', :to => 'profiles#login', :as => 'login'
  post '/access', :to => 'profiles#access', :as => 'access'
end
