Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  get "home/index"

  # Define las rutas de Devise para :users, usando un solo bloque y saltando la ruta de :passwords
  devise_for :users, skip: [:passwords], controllers: { registrations: 'registrations' }

  # Rutas adicionales para cambiar y actualizar la contraseña de usuario
  devise_scope :user do
    get 'users/change_password', to: 'users#change_password', as: 'change_password'
    patch 'users/update_password', to: 'users#update_password', as: 'update_password'
  end

  # Define la ruta root de la aplicación
  root to: "home#index"

  # Rutas para perfiles, limitadas a show, edit y update
  resource :profile, only: [:show, :edit, :update]

  # Rutas para el chequeo de salud de la aplicación
  get "up" => "rails/health#show", as: :rails_health_check
end
