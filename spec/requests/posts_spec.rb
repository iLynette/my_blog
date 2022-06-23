require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    context 'when the page is opened' do
      it 'return a correct response' do
        get '/users'
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET /show' do
    context 'when the page is opened' do
      it 'returns the correct response' do
        get '/users/'
        expect(response).to have_http_status(302)
      end
    end
  end
end
