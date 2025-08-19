Rails.application.routes.draw do
  resource :session
  resources :users, only: [ :new, :create ]
  resources :passwords, param: :token
  get "dashboard" => "dashboard#index", as: :dashboard
  
  # Chat routes
  resources :chats, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:create]
  end



  # Debug routes for memory testing
  get "debug/memory_status" => "debug#memory_status", as: :debug_memory_status
  get "debug/test_memory_storage" => "debug#test_memory_storage", as: :debug_test_memory_storage
  delete "debug/clear_memories" => "debug#clear_memories", as: :debug_clear_memories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "sessions#new"
end
