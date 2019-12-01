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
                     admin: true,
                     mentor: false,
                     password: "password",
                     password_confirmation: "password"
        )  
        visit  new_session_path
        fill_in  'Email' ,  with: 'adali@gmail.com'
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
    scenario "Test if mentee can send session" do
       click_link 'Mentor'
    #    click_link 'Send a Session'
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
        click_button '登録する'
        expect(page).to have_content ''  
        # # visit users_path
        # click_link 'Mentee'    
    end
    scenario "Test search by First name " do
  end
end