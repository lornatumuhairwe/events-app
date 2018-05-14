require 'rails_helper'

RSpec.describe HomeController do
    let(:user) { instance_double(User) }

    describe "GET #index" do
        it "returns status ok" do
            log_in(user)

            get :index
            expect(response.status).to be(200)
        end

        it "blocks unauthenticated user" do
            log_in nil

            get :index
            expect(response.status).to be(302)
        end
    end
end
