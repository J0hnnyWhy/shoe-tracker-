require("bundler/setup")
Bundler.require(:default)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end

get('/store/:id') do
  @store = Store.find(params.fetch('id'))
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:store)
end

post('/store_add/') do
  @name = params.fetch('name')
  @store = Store.create({:name => @name})
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

patch('/store/:id') do
  date = params.fetch('update')
  @store = Store.find(params.fetch('id'))
  @store.update({:name => date})
  @stores = Store.all()
  erb(:store)
end

delete('/store/:id') do
  @store = Store.find(params.fetch('id'))
  @store.delete()
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:index)
end
