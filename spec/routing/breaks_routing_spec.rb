require "rails_helper"

RSpec.describe BreaksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/breaks").to route_to("breaks#index")
    end

    it "routes to #new" do
      expect(:get => "/breaks/new").to route_to("breaks#new")
    end

    it "routes to #show" do
      expect(:get => "/breaks/1").to route_to("breaks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/breaks/1/edit").to route_to("breaks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/breaks").to route_to("breaks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/breaks/1").to route_to("breaks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/breaks/1").to route_to("breaks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/breaks/1").to route_to("breaks#destroy", :id => "1")
    end

  end
end
