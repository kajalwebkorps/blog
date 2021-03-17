Rails.application.routes.draw do
  resources :articles do
  	resources :comments
  end
  get "all_article", to: "articles#all_article"
  root "articles#index"
end
