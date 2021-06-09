Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
