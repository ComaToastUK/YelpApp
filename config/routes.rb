Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  get 'welcome/index'

   root 'welcome#index'
   resources :restaurants do
     resources :comments
   end


  get 'static_pages/home'
  resources :restaurants


  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
