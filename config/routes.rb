# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'shops#top'
  post '/shops' => 'shops#create'
  get '/shops' => 'shops#show'
  get '/description' => 'shops#description'
  get '/comments' => 'comments#new'
  post '/comments' => 'comments#create'
  get '/comments/89610' => 'comments#show'
end
