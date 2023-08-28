Rails.application.routes.draw do
  devise_for :users
  get 'homes/index'
  get 'homes/:id', to: 'homes#show', as: 'show_home'

  root 'homes#index'

  namespace :editor do
    
    resources  :news
  end



  namespace :admin do
   
    
    resources :categories

    get '/categories/:category_id/news/:news_id', to: 'categories#news' ,as: 'categor_news'

    resources :news do
      collection do
        get :search
      end
    end
    

   
  resources :states do
      resources :cities
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "news#index"
end
