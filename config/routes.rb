Rails.application.routes.draw do
  root "home#index"
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :new, :create]
  end
end
