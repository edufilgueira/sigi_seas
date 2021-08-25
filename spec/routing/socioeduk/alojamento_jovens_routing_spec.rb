require "rails_helper"

RSpec.describe Socioeduk::AlojamentoJovensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/alojamento_jovens").to route_to("socioeduk/alojamento_jovens#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/alojamento_jovens/new").to route_to("socioeduk/alojamento_jovens#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/alojamento_jovens/1").to route_to("socioeduk/alojamento_jovens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/alojamento_jovens/1/edit").to route_to("socioeduk/alojamento_jovens#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/alojamento_jovens").to route_to("socioeduk/alojamento_jovens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/alojamento_jovens/1").to route_to("socioeduk/alojamento_jovens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/alojamento_jovens/1").to route_to("socioeduk/alojamento_jovens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/alojamento_jovens/1").to route_to("socioeduk/alojamento_jovens#destroy", :id => "1")
    end
  end
end
