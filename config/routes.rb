Rails.application.routes.draw do
  get 'following_relationships/follow'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users # deiviseで管理するオブジェクトの指定
  root to: 'books#index' # rootの設定
  resources :books
  resources :users, only: %i(index show)

  devise_scope :user do
    post '/users/:id/follow' => 'following_relationships#follow'
  end
end
