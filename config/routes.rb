Rails.application.routes.draw do
  resources :courses do
    resources :lessons
  end

  resources :lessons, only: [] do
    resources :questions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'courses#index'
end
