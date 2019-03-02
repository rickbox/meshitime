Rails.application.routes.draw do
  root to: 'shops#search'
  get '/:id', to: 'shops#show'
end
