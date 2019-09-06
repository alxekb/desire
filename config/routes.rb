Rails.application.routes.draw do
  scope module: :v1 do
    resources :news, only: %i[index show create update]
    resources :authors, only: %i[index show]
  end
  post '/login', to: 'authenticate#authenticate'
end
