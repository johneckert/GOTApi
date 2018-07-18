Rails.application.routes.draw do
  get '/characters/', to: 'characters#index'
  get '/characters/gender', to: 'characters#gender'
  get '/characters/name', to: 'characters#name'
  get '/characters/culture', to: 'characters#culture'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
