Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope :v1 do
      resources :todos, only: [:index]
    end
  end

  root "todos#index"
  resources :todos, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
