Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          get :me
          post :login
        end
      end

      resources :advisors do
        member do
          get :questions
          post 'questions' => 'advisors#create_question'
        end
      end

      resources :questions, only: [:show, :update, :destroy]
    end
  end
end
