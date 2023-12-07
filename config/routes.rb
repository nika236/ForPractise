Rails.application.routes.draw do

  resources :hotels do
    resources :rooms, except: [:index], shallow: true do
      resources :bookings , except: [:index]
      end
  end
  root 'hotels#index'
end
