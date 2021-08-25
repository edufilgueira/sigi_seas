require "rails_helper"

RSpec.describe Socioeduk::MetodoContraceptivosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/metodo_contraceptivos").to route_to("socioeduk/metodo_contraceptivos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/metodo_contraceptivos/new").to route_to("socioeduk/metodo_contraceptivos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/metodo_contraceptivos/1").to route_to("socioeduk/metodo_contraceptivos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/metodo_contraceptivos/1/edit").to route_to("socioeduk/metodo_contraceptivos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/metodo_contraceptivos").to route_to("socioeduk/metodo_contraceptivos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/metodo_contraceptivos/1").to route_to("socioeduk/metodo_contraceptivos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/metodo_contraceptivos/1").to route_to("socioeduk/metodo_contraceptivos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/metodo_contraceptivos/1").to route_to("socioeduk/metodo_contraceptivos#destroy", :id => "1")
    end

  end
end
