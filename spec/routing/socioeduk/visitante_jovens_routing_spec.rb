require "rails_helper"

RSpec.describe Socioeduk::VisitanteJovensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/visitante_jovens").to route_to("socioeduk/visitante_jovens#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/visitante_jovens/new").to route_to("socioeduk/visitante_jovens#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/visitante_jovens/1").to route_to("socioeduk/visitante_jovens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/visitante_jovens/1/edit").to route_to("socioeduk/visitante_jovens#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/visitante_jovens").to route_to("socioeduk/visitante_jovens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/visitante_jovens/1").to route_to("socioeduk/visitante_jovens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/visitante_jovens/1").to route_to("socioeduk/visitante_jovens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/visitante_jovens/1").to route_to("socioeduk/visitante_jovens#destroy", :id => "1")
    end
  end
end
