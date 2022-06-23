require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Kayline', bio: 'Developer', posts_counter: 0, confirmed_at: Time.now,
                          email: 'test@mail.com', password: 'test123')
      @post = Post.create(author: @user, title: 'Tests', text: 'testing', likes_counter: 7,
                          comments_counter: 5)
    end
    before { @post.save }
    it 'if there is max 250 characters' do
      @post.title = 'Testing'
      expect(@post).to be_valid
    end
    it 'if likes counter is integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = -9
      expect(@post).to_not be_valid
    end
    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = -5
      expect(@post).to_not be_valid
    end
    it 'if comments counter is integer' do
      @post.comments_counter = 8
      expect(@post).to be_valid
    end
  end
end

RSpec.feature 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Lynette', photo: 'profile.png', bio: 'Developer from Zambia',
                        email: 'lynette@mail.com', password: 'password', confirmed_at: Time.now, role: 'admin', posts_counter: 0)
    Post.create(title: 'My title', text: 'My text', author_id: @user.id, likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(text: 'My first comment', author: User.first, post: Post.first)
    @comment = Comment.create(text: 'My second comment', author: User.first, post: Post.first)
    @like = Like.create(author_id: User.first.id, post_id: Post.first.id)
    visit new_user_session_path
    fill_in 'Email', with: 'lynette@mail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/users/#{User.first.id}/posts"
  end
  describe 'View posts' do
    scenario 'See a section of pagination' do
      expect(page).to have_content('1')
      expect(page).to have_content('2')
    end
    scenario 'I can see the posts title.' do
      expect(page).to have_content 'My title'
    end
    scenario 'I can see who wrote the post' do
      expect(page).to have_content 'Lynette'
    end
    scenario 'I can see the post text.' do
      expect(page).to have_content 'My text'
    end
    scenario 'I can see the post likes counter.' do
      expect(page).to have_content 'Likes: 1'
    end
    scenario 'I can see the post comments counter.' do
      expect(page).to have_content 'Comments: 2'
    end
    scenario 'I can see the post comments.' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end
  end
end