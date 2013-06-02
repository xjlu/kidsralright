Kidsralright::Application.routes.draw do
  devise_for :users

  root :to => "application#home_page"

  resources :schools do
    resources :classrooms
    resources :students
  end

  resources :accounts
end
