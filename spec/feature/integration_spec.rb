# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs for title' do #valid input for title
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '10.0'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'valid inputs for author' do #valid input for author
    visit new_book_path
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: '10.0'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J. K. Rowling')
  end

  scenario 'valid inputs for price' do #valid input for price
    visit new_book_path
    fill_in 'Price', with: '10.0'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Title', with: 'harry potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('10.0')
  end

  scenario 'valid inputs for published date' do #valid input for published date
    visit new_book_path
    fill_in 'Price', with: '10.0'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Title', with: 'harry potter'
    select '2001', :from => 'book_date_1i'
    select 'November', :from => 'book_date_2i'
    select '4', :from => 'book_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('2001-11-04')
  end

end