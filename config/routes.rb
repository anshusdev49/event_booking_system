Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post '/auth/login', to: 'authentication#login'
  resources :events do
    put :update, on: :collection
    delete :destroy, on: :collection  
  end
  resources :bookings do
    post  :ticket_book, on: :collection
  end
  resources :tickets
end
