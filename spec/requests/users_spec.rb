require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
       context "when the page is opened" do
        it "return a correct response" do
          get '/users'
          expect(response).to have_http_status(200)
          expect(response.body).to render_template(:index)
          expect(response.body).to include('Show all users')
        end
      end
  end
end
