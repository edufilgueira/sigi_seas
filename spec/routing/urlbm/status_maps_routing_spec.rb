require "rails_helper"

RSpec.describe Urlbm::StatusMapsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/urlbm/status_maps").to route_to("urlbm/status_maps#index")
    end

    it "routes to #new" do
      expect(:get => "/urlbm/status_maps/new").to route_to("urlbm/status_maps#new")
    end

    it "routes to #show" do
      expect(:get => "/urlbm/status_maps/1").to route_to("urlbm/status_maps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/urlbm/status_maps/1/edit").to route_to("urlbm/status_maps#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/urlbm/status_maps").to route_to("urlbm/status_maps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/urlbm/status_maps/1").to route_to("urlbm/status_maps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/urlbm/status_maps/1").to route_to("urlbm/status_maps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/urlbm/status_maps/1").to route_to("urlbm/status_maps#destroy", :id => "1")
    end
  end
end
