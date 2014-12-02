Rails.application.routes.draw do
  devise_for :users
  
  resources :books, shallow: true do 
    resources :recommendations
  end

  resources :users, shallow: true do 
    resource :profile, only: [:show]
    resource :club
    
    resources :friends
  end
  
  resource :profile, only: [:new, :create, :edit, :update, :destroy]
  
  root to: "static#query"
  
  get 'static/query'
  post 'static/search', as: :book_search
end
