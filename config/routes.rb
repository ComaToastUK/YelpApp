Rails.application.routes.draw do
  get 'welcome/index'

   root 'welcome#index'
   resources :restaurants


  get 'static_pages/home'
  resources :restaurants


  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
