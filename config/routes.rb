Rails.application.routes.draw do
  root to: "books#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :books
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
