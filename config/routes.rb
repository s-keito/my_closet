Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    resources :rooms, only: [:create, :index, :show]
    member do
      get 'favorites'
      get 'followings'
      get 'followers'
      resources :messages, only: [:create]
    end
  end
  resources :dresses, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get "search" => "searches#search"
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end

 devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
 end

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    resources :users
    resources :dresses
    resources :comments, only: [:destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
