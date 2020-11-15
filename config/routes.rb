# frozen_string_literal: true

Rails.application.routes.draw do
  get 'upload/index'
  get 'upload/show'
  get 'upload/new'
  post 'upload/create'
  get 'upload/edit'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
