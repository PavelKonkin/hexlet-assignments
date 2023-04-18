# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    scope module: :posts do
      resources :comments, shallow: true, only: %i[new create]
      resources :comments, only: %i[edit update destroy]
    end
  end
  # END
end
