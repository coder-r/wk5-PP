require('sinatra')
require('sinatra/contrib/all')

require_relative('models/manufacturer.rb')
require_relative('models/product.rb')
also_reload('./models/*')

#ADD
get '/inventory/manufacturer/add-manufacturer' do
  erb (:"manufacturer/add")
end

#SHOW
get '/inventory/manufacturer/:id' do
  @manufacturer = Manufacturer.find(params['id'].to_i())
  erb (:"manufacturer/show")
end

#CREATE
post '/inventory/manufacturer' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to "/inventory"
end

#EDIT
get '/inventory/manufacturer/:id/edit' do
  @manufacturer = Manufacturer.find(params[:id])
  erb (:"manufacturer/edit")
end

#UPDATE
post '/inventory/manufacturer/:id' do
  Manufacturer.new(params).update()
  redirect to "/inventory/manufacturer/#{params['id']}"
end

#DELETE
post '/inventory/manufacturer/:id/delete' do
  manufacturer = Manufacturer.find(params[:id])
  manufacturer.delete()
  redirect to "/inventory"
end
