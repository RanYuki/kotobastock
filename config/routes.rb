Rails.application.routes.draw do

  resources :users, only: [:edit, :update, :destroy]
  root 'users#top'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage_user'
  get 'users/:id/edit_name' => 'users#edit_name', as: 'edit_name_user'
  get 'users/:id/edit_email' => 'users#edit_email', as: 'edit_email_user'

  resources :terms, only: [:new, :create, :index, :show]
  resources :sentences
  resources :concepts
  resources :authors
  resources :favorites, only: [:create, :destroy]
  resources :contacts
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  namespace :admins do
    resources :users, only:[:show, :index, :edit, :update, :destroy]
    resources :terms, only: [:index, :edit, :update, :destroy]
    resources :sources
    resources :authors, only:[:edit, :update, :destroy]
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
