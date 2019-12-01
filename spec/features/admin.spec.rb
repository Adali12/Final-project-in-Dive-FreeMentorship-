require 'rails_helper'
RSpec.feature "User management", type: :feature do
  background do
    User.create!(firstName: "olivier", 
    lastName: "Harerimana",
    email: "olivier@gmail.com",
    address: "nyarugenge",
    bio: "developer",
    occupation: "diveintocode",
    expertise: "expertise",
    admin: false,
    mentor: true,
    password: "password",
    password_confirmation: "password"
)  
    visit new_session_path
    fill_in 'Email', with: 'olivier@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  scenario "Test if admin can access administration dashboard" do
    visit admin_users_path
  end
  scenario "Test if admin can create user" do
   visit admin_users_path
   click_link 'Signup'
    fill_in 'Firstname', with: 'Aimable'
    fill_in 'Lastname', with: 'Aima'
    fill_in 'Email', with: 'aima@gmail.com'
    fill_in 'Address', with: 'kicukiro'
    fill_in 'Occupation', with: 'code'
    fill_in 'Bio', with: 'code'
    fill_in 'Expertise', with: 'exp'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button '登録する'
    expect(page).to have_content ''   
   end
end