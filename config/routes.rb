Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users
  root 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
