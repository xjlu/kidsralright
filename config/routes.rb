Kidsralright::Application.routes.draw do
  devise_for :users

  root to: "application#home_page"
  match "/timeline", controller: "timeline", action: "index", via: [:get]

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
end
