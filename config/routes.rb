Rails.application.routes.draw do
  root 'static_pages#index'

  get    'tasks/:id'                => 'tasks#show'
  get    'tasks'                    => 'tasks#index'
  post   'tasks'                    => 'tasks#create'
  put    'tasks/:id'                => 'tasks#update'
  put    'tasks/:id/mark_complete'  => 'tasks#mark_complete'
  put    'tasks/:id/mark_active'    => 'tasks#mark_active'
  delete 'tasks/:id'                => 'tasks#destroy'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path'    => 'static_pages#index'
end
