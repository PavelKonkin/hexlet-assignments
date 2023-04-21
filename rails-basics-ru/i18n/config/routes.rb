# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope '/(:locale)', locale: /ru|en/ do
    root 'home#index'
    resources :posts do
      scope module: :posts do
        resources :comments, only: %i[new create edit update destroy]
        #resources :comments, only: %i[new create]
      end
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
