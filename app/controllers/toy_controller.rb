class ToyController < Sinatra::Base

  set :views, 'app/views/toy'
  get '/toys' do
    @toys = Toy.all
    erb :index
  end
end