class DogController < Sinatra::Base

  set :views, 'app/views/dog'

  get '/dogs' do
    @dogs = Dog.all
    erb :index
  end

  get '/dogs/new' do
    erb :new
  end

  get '/dogs/:id' do
    @dog = Dog.find(params[:id])
    erb :show
  end

  post '/dogs' do
    dog = Dog.find_or_create_by(name: params[:name],
                                breed: params[:breed])
    redirect "/dogs/#{dog.id}"
  end
end