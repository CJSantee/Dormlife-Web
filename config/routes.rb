Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :colleges do
    resources :residence_halls
  end

  root 'colleges#index'
end
