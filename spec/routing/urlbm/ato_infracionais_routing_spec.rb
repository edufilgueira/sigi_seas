require "rails_helper"

RSpec.describe Urlbm::AtoInfracionaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/urlbm/ato_infracionais").to route_to("urlbm/ato_infracionais#index")
    end

    it "routes to #new" do
      expect(:get => "/urlbm/ato_infracionais/new").to route_to("urlbm/ato_infracionais#new")
    end

    it "routes to #show" do
      expect(:get => "/urlbm/ato_infracionais/1").to route_to("urlbm/ato_infracionais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/urlbm/ato_infracionais/1/edit").to route_to("urlbm/ato_infracionais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/urlbm/ato_infracionais").to route_to("urlbm/ato_infracionais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/urlbm/ato_infracionais/1").to route_to("urlbm/ato_infracionais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/urlbm/ato_infracionais/1").to route_to("urlbm/ato_infracionais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/urlbm/ato_infracionais/1").to route_to("urlbm/ato_infracionais#destroy", :id => "1")
    end
  end
end
