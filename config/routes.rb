Kidsralright::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/signin", to: "devise/sessions#new"
    get "/signout", to: "devise/sessions#destroy"
  end

  root to: "application#home_page"
  match "/timeline", controller: "timeline", action: "index", via: [:get]

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
