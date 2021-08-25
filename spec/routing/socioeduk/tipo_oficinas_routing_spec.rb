require "rails_helper"

RSpec.describe Socioeduk::TipoOficinasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_oficinas").to route_to("socioeduk/tipo_oficinas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_oficinas/new").to route_to("socioeduk/tipo_oficinas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_oficinas/1").to route_to("socioeduk/tipo_oficinas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_oficinas/1/edit").to route_to("socioeduk/tipo_oficinas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_oficinas").to route_to("socioeduk/tipo_oficinas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_oficinas/1").to route_to("socioeduk/tipo_oficinas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_oficinas/1").to route_to("socioeduk/tipo_oficinas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_oficinas/1").to route_to("socioeduk/tipo_oficinas#destroy", :id => "1")
    end
  end
end
