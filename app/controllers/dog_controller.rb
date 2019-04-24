class DogController < Sinatra::Base

  set :views, 'app/views/dog'

  get '/dogs' do
    @dogs = Dog.all
    erb :index
  end
end