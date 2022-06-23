require 'rails_helper'

RSpec.feature 'Tests login page', type: :feature do
    background { visit new_user_session_path }
    scenario 'login form present' do
      expect(page.has_field?('Email')).to be true
      expect(page.has_field?('Password')).to be true
      expect(page.has_button?('Log in')).to be true
    end

  end