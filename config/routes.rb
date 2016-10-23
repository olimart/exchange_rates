Rails.application.routes.draw do

  resources :rates, only: [:show]
  root to: 'pages#home'

end
