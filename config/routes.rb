Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome#index'
  resources :jobs do
    resources :resumes
    collection do
      get :search
      end
  end

  namespace :admin do
   resources :jobs do
    member do
      post :hide
      post :publish
      end
      resources :resumes
    end
 end

  root 'welcome#index'
end
