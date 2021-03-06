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

post('/store_shoe_add/') do
  shoe_name = params.fetch('shoe_add')
  new_shoe = Shoe.create({:shoe_name => shoe_name})
  # shoe = Shoe.find_by({:shoe_name => new_shoe})
  store_id = params.fetch('store_id')
  store = Store.find(store_id)
  store.shoes.push(new_shoe)
  @store = store
  erb(:store)
end

get('/shoe/:id') do
  @shoe = Shoe.find(params.fetch('id'))
  @stores = Store.all()
  @shoes = Shoe.all()
  erb(:shoe)
end

post('/shoe_add/') do
  @shoe_name = params.fetch('shoe_name')
  @shoe = Shoe.create({:shoe_name => @shoe_name})
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

delete('/shoe/:id') do
  @shoe = Shoe.find(params.fetch('id'))
  @shoe.delete()
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end
