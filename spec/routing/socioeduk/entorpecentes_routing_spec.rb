require "rails_helper"

RSpec.describe Socioeduk::EntorpecentesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/entorpecentes").to route_to("socioeduk/entorpecentes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/entorpecentes/new").to route_to("socioeduk/entorpecentes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/entorpecentes/1").to route_to("socioeduk/entorpecentes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/entorpecentes/1/edit").to route_to("socioeduk/entorpecentes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/entorpecentes").to route_to("socioeduk/entorpecentes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/entorpecentes/1").to route_to("socioeduk/entorpecentes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/entorpecentes/1").to route_to("socioeduk/entorpecentes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/entorpecentes/1").to route_to("socioeduk/entorpecentes#destroy", :id => "1")
    end

  end
end
