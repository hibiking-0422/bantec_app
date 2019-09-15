Rails.application.routes.draw do
  get 'subcons/index'
  get 'subcons/new'
  get 'subcons/edit'
  get 'works/index'
  get 'works/new'
  get 'works/show'
  get 'works/edit'
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

  resources :works do
    member do
      get 'delete'
    end
  end

  resources :subcons do
    member do
      get 'delete'
    end
  end
end
