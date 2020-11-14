Rails.application.routes.draw do
  resources :comments
  get 'events/index'
  # Users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Forum
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  # Cinemas
  resources :transactions

  # Root Page
  root 'welcome#index'

  # Movies Page
  get 'welcome/movies', to: 'welcome#movies'

  # About Page
  get 'welcome/about', to: 'welcome#about'

  # Contact Page
  get 'welcome/contact', to: 'welcome#contact'

  # Activity Page
  get 'welcome/events', to: 'events#index'

  # Send Email (Contact Page)
  post 'request_contact', to: 'welcome#request_contact'

  mount ActionCable.server => '/cable'
end
