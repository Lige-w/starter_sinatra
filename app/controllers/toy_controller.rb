class ToyController < Sinatra::Base

  set :views, 'app/views/toy'
  set :method_override, true

  get '/toys' do
    @toys = Toy.all
    erb :index
  end

  get '/toys/:id/edit' do
    @toy = Toy.find(params[:id])
    erb :edit
  end

  get '/toys/new' do
    erb :new
  end

  post '/toys' do
    toy = Toy.find_or_create_by(name: params[:name], dog: Dog.find(params[:dog]))
    redirect "/dogs/#{params[:dog]}"
  end

  patch '/toys/:id' do
    @toy = Toy.find(params[:id])
    @toy.update(name: params[:name])
    @dog = Dog.find(params[:dog][:id])
    redirect '/toys'
  end

  delete '/toys/:id' do
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect '/toys'
  end
end
