Rails.application.routes.draw do
  post 'api/imc', to: 'imcs#calcula'
end
