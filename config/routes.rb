Rails.application.routes.draw do
  resources :friends

  resources :profiles

  resources :recommendations

  resources :books

  devise_for :users
  
  root to: "static#query"
  
  get 'static/query'
  post 'static/search', as: :book_search
end
