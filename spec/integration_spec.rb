ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Shoe Tracker App', type: :feature) do
  describe('add store functionality') do
    it('adds a new store') do
      visit('/')
      fill_in('name', with: 'discount store')
      click_button('Add Store')
      expect(page).to(have_content('Discount store'))
    end
  end

  describe('view a store and their shoes') do
    it('allow a user to follow link to page') do
      visit('/')
      fill_in('name', with: 'discount')
      click_button('Add Store')
      click_link('Discount')
      expect(page).to(have_content('Store: Discount'))
    end
  end

  describe('add a shoe to a store') do
    it('allow a user to add a shoe to a store') do
      visit('/')
      fill_in('name', with: 'discount')
      click_button('Add Store')
      click_link('Discount')
      fill_in('enter new shoe', with: 'nike')
      click_button('Add')
      expect(page).to(have_content('Nike'))
    end
  end

  describe('update a store name') do
    it('allow a user to update the store name') do
      visit('/')
      fill_in('name', with: 'discount')
      click_button('Add Store')
      click_link('Discount')
      fill_in('enter new store name', with: 'nike')
      click_button('Update')
      expect(page).to(have_content('Store: Nike'))
    end
  end

  describe('delete a store') do
    it('allow a user to a store name') do
      visit('/')
      fill_in('name', with: 'discount')
      click_button('Add Store')
      click_link('Discount')
      click_button('Delete Store')
      expect(page).to(have_content('Welcome to'))
    end
  end


end
