require 'rails_helper'

describe "user sign out", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "sign out the user" do
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    click_button "Log in"
    click_on("Logout")

    expect(page).not_to have_content 'user@example.com'
  end

end
