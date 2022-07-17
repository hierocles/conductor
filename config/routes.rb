# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :nations, only: %i[index show create update]
    end
  end
end
