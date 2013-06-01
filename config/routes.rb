Kidsralright::Application.routes.draw do
  devise_for :users

  match '/', :to => "application#index"
end
