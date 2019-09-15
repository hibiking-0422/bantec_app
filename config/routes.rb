Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'
  
  resources :projects do
    member do
      get 'delete'
    end
  end
  get 'projects/new', to:'projects#new'

  resources :drivers do
    member do
      get 'delete'
    end
  end
end
