require 'rails_helper'

RSpec.feature 'Tests login page', type: :feature do
  background { visit new_user_session_path }
  scenario 'login form present' do
    expect(page.has_field?('Email')).to be true
    expect(page.has_field?('Password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  context 'Form Submission' do
    scenario 'when you log in without proper credentials' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'when credentials are wrong' do
      within 'form' do
        fill_in 'Email', with: 'gmail.com'
        fill_in 'Password', with: 'secret'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'if credentials are right' do
      @user1 = User.create!(name: 'Lynette', photo: 'mines', bio: 'Developer.', email: 'lynette@gmail.com',
                            password: 'lynette123', confirmed_at: Time.now, role: 'admin')

      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end
end
