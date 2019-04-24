class DogController < Sinatra::Base

  set :views, 'app/views/dog'
  set :method_override, true

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

  get '/dogs/:id/edit' do
    @dog = Dog.find(params[:id])
    erb :edit
  end

  patch '/dogs/:id' do
    @dog = Dog.find(params[:id])
    @dog.update(name: params[:name],
                 breed: params[:breed])
    redirect "/dogs/#{@dog.id}"
  end

  post '/dogs' do
    dog = Dog.find_or_create_by(name: params[:name],
                                breed: params[:breed])
    redirect "/dogs/#{dog.id}"
  end

  delete '/dogs/:id' do
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect '/dogs'
  end

end
