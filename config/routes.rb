require 'api_version_constraint'

Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :registers
      resources :addresses, only: %i[ create update destroy ]
      resources :contacts, only: %i[ create update destroy ]
      resources :companies, only: %i[ show create update destroy ]
    end
  end

end
