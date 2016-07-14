require "rails_helper"

RSpec.describe TestemonialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/testemonials").to route_to("testemonials#index")
    end

    it "routes to #new" do
      expect(:get => "/testemonials/new").to route_to("testemonials#new")
    end

    it "routes to #show" do
      expect(:get => "/testemonials/1").to route_to("testemonials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/testemonials/1/edit").to route_to("testemonials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/testemonials").to route_to("testemonials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/testemonials/1").to route_to("testemonials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/testemonials/1").to route_to("testemonials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/testemonials/1").to route_to("testemonials#destroy", :id => "1")
    end

  end
end
