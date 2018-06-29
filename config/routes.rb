Rails.application.routes.draw do
  devise_for :admins
  resources :user_boards do
    resources :answers
    member do
      patch :complete
    end
  end
  root "user_boards#index"
end
