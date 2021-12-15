Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  post '/colleges/import' => 'colleges#import'

  post '/colleges/:college_id/residence_halls/import' => 'residence_halls#import'

  post '/residents/csv' => 'residents#csv'

  post '/residents/import' => 'residents#import'

  resources :colleges do
    resources :residence_halls do
      resources :rooms
    end
  end

  resources :residents

  root 'colleges#index'
end
