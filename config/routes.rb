Rails.application.routes.draw do
  scope module: :v1 do
    resources :news, only: [:index, :show, :create, :update]
    resources :authors, only: [:index, :show]
  end
end
