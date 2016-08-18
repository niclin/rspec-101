require 'rails_helper'

describe "user sign in", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "sign_in the user" do
    new_session_page.sign_in 'user@example.com', 'password'
    expect(page).to have_content 'user@example.com'
  end

  private

  def home_page
    PageObjects::Pages::Home.new
  end

  def navbar
    PageObjects::Application::Navbar.new
  end

  def new_session_page
    home_page.go
    navbar.sign_in
  end

end
