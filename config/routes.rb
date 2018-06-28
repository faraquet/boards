Rails.application.routes.draw do
  resources :user_boards do
    resources :answers
  end
  root "user_boards#index"
end
