Rails.application.routes.draw do


  get 'direction_load/index'

  namespace :cron do
  get 'asterisk_alias/aliases'
  end

  namespace :cron do
  get 'asterisk_user/index'
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # get 'login/index'

  get 'main/index'
  root 'main#index'

  namespace :pbxadmin do
    resources :international_access, path: 'international_access/(:action)(:id)(.:format)'
  end

  namespace :inventory do
    resources :workstation, path: 'workstation/(:action)(:id)(.:format)'
  end

  resources :login, :path => 'login/(:action)(.:format)'
  resources :address_book, :path => 'address_book/(:action)(.:format)'
  resources :contragent_book, :path => 'contragent_book/(:action)(.:format)'
  resources :my_book, :path => 'my_book/(:action)(.:format)'


  namespace :cron do
    resources :address_book_corp_parser, path: 'address_book_corp_parser/(:action)(:id)(.:format)'
    resources :asterisk_user, :path => 'asterisk_user/(:action)(.:format)'
    resources :asterisk_parser, :path => 'asterisk_parser/(:action)(.:format)'
    resources :asterisk_internal, :path => 'asterisk_internal/(:action)(.:format)'
  end

  namespace :admin do
    resources :autoprovision, path: 'autoprovision/(:action)(:id)(.:format)'
  end

  namespace :mailadmin do
    resources :aliases, path: 'aliases/(:action)(:id)(.:format)'
    resources :mailboxes, path: 'mailboxes/(:action)(:id)(.:format)'
    resources :domains, path: 'domains/(:action)(:id)(.:format)'
  end


  namespace :stat do
    resources :number, path: 'number/(:action)(:id)(.:format)'
    resources :call_direction, path: 'call_direction/(:action)(:id)(.:format)'
    resources :direction_load, path: 'direction_load/(:action)(:id)(.:format)'
    resources :call_stat, path: 'call_stat/(:action)(:id)(.:format)'
    resources :test, path: 'test/(:action)(:id)(.:format)'
  end

  namespace :serv do
    resources :autoprovision, path: 'autoprovision/(:action)(:id)(.cfg)'
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
