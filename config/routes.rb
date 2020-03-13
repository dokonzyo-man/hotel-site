Rails.application.routes.draw do
  get 'top/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'search', to: 'prefectures#search'
  # get '/hotels/:id', to: 'hotels#show'
  resources :contacts
  resources :tops
  resources :prefectures
  resources :hotels do
  	resources :reviews
    resources :reservations
  end
  root 'tops#index'
  # get 'hotels', to: 'top#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
end
