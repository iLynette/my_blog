require 'rails_helper'

RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Lynette', photo: 'profile.png', bio: 'Developer',
                        email: 'lynette@email.com', password: 'password',
                        confirmed_at: Time.now, role: 'admin', posts_counter: 0)
    @user1 = User.create(name: 'Kayline', photo: 'profile.jpg',
                         bio: 'Developer', email: 'kayline@email.com',
                         password: 'password', confirmed_at: Time.now)
    Post.create(title: 'My title', text: 'My text', author_id: @user.id, likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(text: 'My first comment', author: User.first, post: Post.first)
    @comment = Comment.create(text: 'My second comment', author: User.first, post: Post.first)
    @like = Like.create(author_id: User.first.id, post_id: Post.first.id)

    visit new_user_session_path
    fill_in 'Email', with: 'lynette@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/users/#{User.first.id}/posts/#{Post.first.id}"
  end

  describe 'Specs for view posts#show' do
    it 'Can see the posts title.' do
      expect(page).to have_content 'My title'
    end

    it 'Can see who wrote the post' do
      expect(page).to have_content 'Lynette'
    end

    it 'Can see how many comments it has' do
      expect(page).to have_content 'Comments: 2'
    end

    it 'Can see how many likes it has' do
      expect(page).to have_content 'Likes: 1'
    end

    it 'Can see the post body' do
      expect(page).to have_content 'My text'
    end

    it 'Can see the username of each commentor' do
      expect(page).to have_content 'Lynette'
    end

    it 'Can see the comment each commentor left' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end
  end
end
