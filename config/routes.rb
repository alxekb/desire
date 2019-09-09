Rails.application.routes.draw do
  scope module: :v1 do
    resources :authors, only: %i[index show] do
      resources :news, only: %i[index show]
    end
    resources :news, only: %i[index show create update]
  end
  post '/login', to: 'authenticate#authenticate'
end
