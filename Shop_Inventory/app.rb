require('sinatra')
require('sinatra/contrib/all')

require_relative('models/manufacturer.rb')
require_relative('models/product.rb')
also_reload('./models/*')


#INDEX
get '/inventory' do
  @products = Product.all()
  erb (:index)
end
#SHOW
get '/inventory/product/:id' do
  @product = Product.find(params['id'].to_i())
  erb (:"product/show")
end

#ADD
get '/inventory/product/add-product' do
  @manufacturers = Manufacturer.all()
  erb (:"product/add")
end

#CREATE
post '/inventory/product' do
  @product = Product.new(params)
  @product.save()
  redirect ("/inventory")
end

#EDIT
get '/inventory/product/:id/edit' do
  @product = Product.find(params[:id])
  @manufacturers = Manufacturer.all()
  erb (:"product/edit")
end
