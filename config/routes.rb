Rails.application.routes.draw do

  resources :hotels , shallow:true do
    resources :rooms
  end
  root "hotels#index"
end
