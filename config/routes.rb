Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get '/entities' => 'entities#display'

  post '/entities' => 'entities#create'

  root 'pages#dashboard'

  get '/entity/new' => 'entities#new', as: :new_entity
  get '/spanish' => redirect('/?lang=es')

  resources :patients
  get '/patients/:id' => 'patients#index'
  get 'patient/new' => 'patients#new'


  resources :medications
  get '/' => 'medications#index'
  get '/medications/new' => 'medications#new'
  get '/medications/show' => 'medications#show'
  get '/medications' => 'medications#index'

  get '/patient_medications/new' => 'patient_medications#new', as: :new_patient_medication

  post '/patient_medications' => 'patient_medications#create'

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  resources :patients, :medications
  root to: 'pages#dashboard'
  end

get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
get '', to: redirect("/#{I18n.default_locale}/pages")

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
