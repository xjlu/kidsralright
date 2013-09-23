Kidsralright::Application.routes.draw do

  root to: "application#flash_page"

  devise_for :users
  devise_scope :user do
    get "/signin", to: "devise/sessions#new"
    get "/signout", to: "devise/sessions#destroy"
  end

  match "/timeline", controller: "timeline", action: "index", via: [:get]
  match "/admin", controller: "admin", action: "index", via: [:get]

  resources :users

  resources :schools do
    resources :classrooms
    resources :students
  end

  resources :classrooms do
    resources :ksrcomments
  end

  resources :schedules do
    resources :ksrcomments
  end

  resources :accounts

  resources :posts
end
