Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, path: '', path_names: {
    sing_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
