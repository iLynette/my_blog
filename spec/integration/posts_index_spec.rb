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