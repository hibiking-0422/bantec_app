Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :projects

  root to: 'home#index'

  get 'projects/new', to:'projects#new'

end
