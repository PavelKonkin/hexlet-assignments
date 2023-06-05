Blog::Engine.routes.draw do
  root 'posts#index'
  resources :posts, except: :index
end
