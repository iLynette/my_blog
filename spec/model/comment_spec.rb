require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @comment = Comment.new(text: 'My comment', author_id: 2)
    end
    before { @comment }
    it 'title is present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id is integer' do
      @comment.author_id = 'W'
      expect(@comment).to_not be_valid
    end

    it 'author_id is present' do
      @comment.author_id = false
      expect(@comment).to_not be_valid
    end

    it 'author_id is not present' do
      @comment.author_id = nil
      expect(@comment).to_not be_valid
    end
  end
end
