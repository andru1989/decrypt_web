Rails.application.routes.draw do

  root 'codings#index'

  resources :codings, only: :index do
    collection do
      get :encrypt
      get :decrypt
    end
  end

end