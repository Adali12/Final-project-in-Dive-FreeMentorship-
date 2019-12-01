require 'rails_helper'
RSpec.feature " user management function ", type: :feature do
background do
    User.create!(firstName: "olivier", 
    lastName: "Harerimana",
    email: "olivier@gmail.com",
    address: "nyarugenge",
    bio: "developer",
    occupation: "diveintocode",
    expertise: "expertise",
    admin: false,
    mentor: false,
    password: "password",
    password_confirmation: "password"
)  
visit  new_session_path
fill_in  'Email' ,  with: 'olivier@gmail.com'
 fill_in  'Password' ,  with: 'password'
 click_button 'Log in'
 @user = User.first 
end
scenario "Test Mentee Registration" do
    visit new_session_path
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
scenario "Test successful login" do
visit  new_session_path
fill_in  'Email' ,  with: 'aima@gmail.com'
fill_in  'Password' ,  with: 'password'
click_button 'Log in'
end
scenario "Test password reset" do
    visit new_session_path
    fill_in 'Email', with: 'aimable@gmail.com'
    # expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    # # visit letters 
    # # visit edit_user_password_path
    # # save_and_open_page
    # # fill_in 'Password', with: 'password'
    # # click_button 'Change my password'
  end
end
