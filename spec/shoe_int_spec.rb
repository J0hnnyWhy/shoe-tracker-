ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Shoe Tracker App', type: :feature) do
  describe('add shoe functionality') do
    it('adds a new shoe') do
      visit('/')
      fill_in('shoe_name', with: 'puma')
      click_button('Add Shoe')
      expect(page).to(have_content('Puma'))
    end
  end

  describe('go to a specific shoe page') do
    it('follows link to a specific shoe page') do
      visit('/')
      fill_in('shoe_name', with: 'puma')
      click_button('Add Shoe')
      click_link('Puma')
      expect(page).to(have_content('Shoe: Puma'))
    end
  end

  describe('go to a specific shoe page') do
    it('follows link to a specific shoe page') do
      visit('/')
      fill_in('shoe_name', with: 'puma')
      click_button('Add Shoe')
      click_link('Puma')
      click_button(Delete Shoe)
      expect(page).to(have_content('Wecome to'))
    end
  end
end
