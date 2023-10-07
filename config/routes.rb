Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :patients do
    member do
    get "recommendations"
    get "analyze"
  end
end
  resources :consultation_requests do
    member do
      post "recommendations"
    end
  end
end
