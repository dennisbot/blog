Rails.application.routes.draw do
  resources :zombies
  get 'welcome/index'
  get 'posts/new'
  get "posts/:id" => "posts#show", :as => :post
  get "posts" => "posts#index"
  post "posts" => "posts#create"
  root "welcome#index"
  # root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
