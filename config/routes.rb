Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  
  root "discussions#index"

  resources :discussions do
    resources :replies
  end

  resources :channels
end
