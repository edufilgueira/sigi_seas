require "rails_helper"

RSpec.describe Biblioteca::LocaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/locais").to route_to("biblioteca/locais#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/locais/new").to route_to("biblioteca/locais#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/locais/1").to route_to("biblioteca/locais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/locais/1/edit").to route_to("biblioteca/locais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/locais").to route_to("biblioteca/locais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/locais/1").to route_to("biblioteca/locais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/locais/1").to route_to("biblioteca/locais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/locais/1").to route_to("biblioteca/locais#destroy", :id => "1")
    end
  end
end
