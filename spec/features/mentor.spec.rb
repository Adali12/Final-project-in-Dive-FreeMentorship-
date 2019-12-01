require 'rails_helper'

RSpec.feature "Mentors management", type: :feature do
    background do
        User.create!(firstName: "Adali", 
                     lastName: "adali",
                     email: "adali@gmail.com",
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
        fill_in  'Email' ,  with: 'adali@gmail.com'
         fill_in  'Password' ,  with: 'password'
         
    end
    scenario "Test user mentee Registration" do
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
        click_button 'Create User'
        expect(page).to have_content 'User was complteted created.'
        visit users_path 
    end
    scenario "Test if mentee can send session" do
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
        click_button 'Create User'
        expect(page).to have_content 'User was complteted created.'  
        visit users_path
        click_link 'Inbox Session'      
end
scenario "Test if mentor can reply session" do
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
    click_button 'Create User'
    expect(page).to have_content 'User was complteted created.'  
    visit users_path
    click_link 'Inbox Session'    
end
        scenario "Test search by First name or expertise" do
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
            click_button 'Create User'
            expect(page).to have_content 'User was complteted created.'
            visit users_path
            fill_in 'Search', with: 'Aimable'
           
            expect(page).to have_content ''
     
  end
  scenario "change mentee as mentor" do
    visit new_session_path
    visit admin_users_path 
    click_link 'Signup'
    fill_in 'Firstname', with: 'Aimable'
    fill_in 'Lastname', with: 'Aima'
    fill_in 'Email', with: 'adali@gmail.com'
    fill_in 'Address', with: 'kicukiro'
    fill_in 'Occupation', with: 'code'
    fill_in 'Bio', with: 'code'
    fill_in 'Expertise', with: 'exp'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    visit new_admin_user_path  

end
end