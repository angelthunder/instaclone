Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :posts, only: %i[new create] do
    resources :comments,
      only: %i[new create],
      defaults: { likable: "comment" } do
        resources :likes, only: :create do
          collection do
            delete :destroy
          end
        end
      end

    resources :likes, only: :create, defaults: { likable: "post" } do
      collection do
        delete :destroy
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "site#index"
end
