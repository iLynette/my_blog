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

    end
  end