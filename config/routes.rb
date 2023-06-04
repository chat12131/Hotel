Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticate :user do
      get 'users/profile/edit', to: 'users/registrations#profile_edit', as: 'user_profile_edit'
      get 'users/profile', to: 'users/registrations#profile', as: 'user_profile'
      get 'users/account', to: 'users/registrations#account', as: 'user_account'
    end
  end

  resources :rooms
  get 'myrooms',to:'rooms#myrooms'
  get 'search',to:'rooms#search'
  get '/',to:'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
