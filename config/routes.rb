Rails.application.routes.draw do
  post '/imc', to: 'imcs#calcula'
end
