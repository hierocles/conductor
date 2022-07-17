# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :nations, only: %i[index show]
      resources :regions, only: %i[index show]
      resources :endorsements, only: %i[index show]
    end
  end
end
