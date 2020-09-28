# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: { sessions: 'sessions' },
             path: '/',
             path_names: { sign_in: :login, sign_out: :logout }
  devise_scope :user do
    get '/current', to: 'sessions#show'
  end
  root to: 'application#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
