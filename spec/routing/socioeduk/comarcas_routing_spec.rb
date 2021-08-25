require "rails_helper"

RSpec.describe Socioeduk::ComarcasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/comarcas").to route_to("socioeduk/comarcas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/comarcas/new").to route_to("socioeduk/comarcas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/comarcas/1").to route_to("socioeduk/comarcas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/comarcas/1/edit").to route_to("socioeduk/comarcas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/comarcas").to route_to("socioeduk/comarcas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/comarcas/1").to route_to("socioeduk/comarcas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/comarcas/1").to route_to("socioeduk/comarcas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/comarcas/1").to route_to("socioeduk/comarcas#destroy", :id => "1")
    end
  end
end
