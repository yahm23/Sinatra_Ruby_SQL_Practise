require('sinatra')
require('sinatra/contrib/all') if development?

#require_relative('./models/customer.rb')
require_relative('./models/film.rb')
#require_relative('./models/ticket.rb')

also_reload('./models/*')

get '/films' do
  @films = Film.all
  erb ( :films )
end

# get 'films/:index' do
#   length = Film.all.count
#   for num in length
#     index = params[:index].to_i
#     erb (:index)
#   end
# end

get '/films/:index' do
  films = Film.all
  id = params[:index].to_i - 1
  @price = films[id].price
  erb (:'films/index')
end
