Kidsralright::Application.routes.draw do
  devise_for :users

  match '/', :to => "application#index"

  resources :schools do
    resources :classrooms
    resources :students
  end

  resources :accounts
end
