Rails.application.routes.draw do
  get 'archive/index'
  resources :entries
  get'entries/index',to:'entries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
