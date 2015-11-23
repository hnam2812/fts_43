Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"

  devise_for :users, path_prefix: "d"
  namespace :admin do
    root "static_pages#admin_home"
    resources :subjects
  end
end
