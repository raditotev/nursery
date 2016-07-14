require 'rails_helper'

RSpec.describe "Testemonials", type: :request do
  describe "GET /testemonials" do
    it "works! (now write some real specs)" do
      get testemonials_path
      expect(response).to have_http_status(200)
    end
  end
end
