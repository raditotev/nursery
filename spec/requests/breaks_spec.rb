require 'rails_helper'

RSpec.describe "Breaks", type: :request do
  describe "GET /breaks" do
    it "works! (now write some real specs)" do
      get breaks_path
      expect(response).to have_http_status(200)
    end
  end
end
