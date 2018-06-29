Rails.application.routes.draw do
  devise_for :admins
  resources :user_boards do
    resources :answers
    member do
      patch :complete
    end
  end

  unauthenticated do
    root to: 'user_boards#new'
  end

  authenticated do
    root to: 'user_boards#index'
  end

end
