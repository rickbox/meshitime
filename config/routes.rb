# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "shops#top"
  post "/create" => "shops#create"
  get "/show" => "shops#show"
end
