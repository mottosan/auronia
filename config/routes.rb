Rails.application.routes.draw do
  namespace :admin do
      resources :documents
      resources :tags
      resources :users

      root to: "documents#index"
    end
  scope module: "api" do
    namespace :v1 do
      resources :documents, only: [:index, :create, :show, :destroy, :update] do
        resources :tags
      end
      post "authenticate", to: "authentication#create"
    end
  end
end
