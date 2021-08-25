require "rails_helper"

RSpec.describe Urlbm::MapasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/urlbm/mapas").to route_to("urlbm/mapas#index")
    end

    it "routes to #new" do
      expect(:get => "/urlbm/mapas/new").to route_to("urlbm/mapas#new")
    end

    it "routes to #show" do
      expect(:get => "/urlbm/mapas/1").to route_to("urlbm/mapas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/urlbm/mapas/1/edit").to route_to("urlbm/mapas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/urlbm/mapas").to route_to("urlbm/mapas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/urlbm/mapas/1").to route_to("urlbm/mapas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/urlbm/mapas/1").to route_to("urlbm/mapas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/urlbm/mapas/1").to route_to("urlbm/mapas#destroy", :id => "1")
    end
  end
end
