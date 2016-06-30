Rails.application.routes.draw do
  get 'socializations/follow'

  get 'socializations/unfollow'

  get 'static/about'

  get 'home/index'

  get 'about', to: 'static#about'

  root 'posts#index'
  get '/', to: 'posts#index'

  resources :posts
  resources :users

  post 'search', to: 'posts#search'

  get 'login', to: 'sessions#new'
  get 'sign_in', to: 'sessions#new'

  get 'home', to: 'users#new'
  get 'signup', to: 'users#new'

  get 'new_user_post', to: 'posts#new'
  delete 'logout', to: "sessions#destroy"

  delete 'sign_out', to: "sessions#destroy"
  delete 'signout', to: "sessions#destroy"

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :posts
    post 'follow',   to: 'socializations#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  resources :posts do
    resources :comments
    post 'like', to: 'socializations#like'
    post 'unlike', to: 'socializations#unlike'
  end

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
