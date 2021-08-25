require "rails_helper"

RSpec.describe Socioeduk::QuartosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/quartos").to route_to("socioeduk/quartos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/quartos/new").to route_to("socioeduk/quartos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/quartos/1").to route_to("socioeduk/quartos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/quartos/1/edit").to route_to("socioeduk/quartos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/quartos").to route_to("socioeduk/quartos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/quartos/1").to route_to("socioeduk/quartos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/quartos/1").to route_to("socioeduk/quartos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/quartos/1").to route_to("socioeduk/quartos#destroy", :id => "1")
    end
  end
end
