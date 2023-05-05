Rails.application.routes.draw do
  get '/steam/:username', to: 'steam#get_hours'
end
