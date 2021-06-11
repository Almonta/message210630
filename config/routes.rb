Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do #, only: [:new, :create, :show, :edit, :update]
    collection do
      post :confirm
    end
  end
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
