Rails.application.routes.draw do
  scope module: :v1 do
    resources :authors, only: %i[index show] do
      resources :news, only: %i[index show create update]
    end
    resources :news, only: :index
  end
  post '/login', to: 'authenticate#authenticate'
end
