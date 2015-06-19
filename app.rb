require("bundler/setup")
Bundler.require(:default)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @venues = Venue.all()
  @bands = Band.all()
  erb(:band)
end

post('/band_add/') do
  @name = params.fetch('name')
  @band = Band.create({:name => @name})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end
