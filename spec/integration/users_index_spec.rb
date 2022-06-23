require 'rails_helper'

RSpec.feature 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'Lynette', photo: 'profile.jpg', bio: 'Developer.', email: 'lynette@gmail.com',
                         password: 'password', confirmed_at: Time.now, posts_counter: 0, role: 'admin')

    @second = User.create(name: 'Kayline', photo: 'profile.jpg', bio: 'Developer.', email: 'kayline@gmail.com',
                          password: 'password', confirmed_at: Time.now, posts_counter: 0, role: 'admin')

    @third = User.create(name: 'Jess', photo: 'profile.jpg', bio: 'Developer.', email: 'jess@gmail.com',
                         password: 'password', confirmed_at: Time.now, posts_counter: 0, role: 'admin')

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  background { visit root_path }
  scenario 'See all usernames' do
    expect(page).to have_content('Lynette')
    expect(page).to have_content('Kayline')
    expect(page).to have_content('Jess')
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content 'profile.jpg'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'Lynette', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end
