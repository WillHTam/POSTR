Rails.application.routes.draw do
  get 'home', to: 'posts#home'

  get 'about', to: 'static#about'

  root 'posts#home'
  get '/', to: 'posts#home'

  resources :posts
  resources :users

  get 'login', to: 'sessions#new'
  get 'sign_in', to: 'sessions#new'

  get 'home', to: 'users#new'
  get 'signup', to: 'users#new'

  get 'new_user_post', to: 'posts#new'
  delete 'logout', to: "sessions#destroy"

  delete 'sign_out', to: "sessions#destroy"
  delete 'signout', to: "sessions#destroy"

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create] do
    resources :posts
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  resources :posts do
    resources :comments
  end

  get 'post/:id/like', to: 'posts#like', as: :like

end


=begin

get 'sign_up', to: 'users#new', as :signup

resources :users, only: [;new, :create] do
  resources :posts
end

get 'sessions/new', as: :sign_in
post 'sessions/create', as: create_session
post 'sessions_destroy', as: :sign_out

get '/', to: 'home#index', as :home

=end
