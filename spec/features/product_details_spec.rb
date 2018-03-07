require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    2.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    visit root_path
    save_screenshot

    #puts 'What is this page you say?', page.html
    within ".products" do
      first(:link, "Details »").click
    end

    #first('.item').click_link('Details »')
    #click_link 'Details »'
    #visit '/products/1'
    #puts 'And this PAGE is what you say?', page.html
    # commented out b/c it's for debugging only

    expect(page).to have_content('Product Reviews')

    save_screenshot

  end
end