class ToyController < Sinatra::Base

  set :views, 'app/views/toy'

  get '/toys' do
    @toys = Toy.all
    erb :index
  end

  get '/toys/new' do
    erb :new
  end

  post '/toys' do
    toy = Toy.find_or_create_by(name: params[:name], dog: Dog.find(params[:dog]))
    redirect "/dogs/#{params[:dog]}"
  end

end
