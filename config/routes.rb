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
    member do
      get 'followings'
      get 'followers'
    end
  end
  resources :dresses, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get "search" => "searches#search"
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
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
