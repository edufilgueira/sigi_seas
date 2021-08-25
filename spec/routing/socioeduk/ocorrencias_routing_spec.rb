require "rails_helper"

RSpec.describe Socioeduk::OcorrenciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/ocorrencias").to route_to("socioeduk/ocorrencias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/ocorrencias/new").to route_to("socioeduk/ocorrencias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/ocorrencias/1").to route_to("socioeduk/ocorrencias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/ocorrencias/1/edit").to route_to("socioeduk/ocorrencias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/ocorrencias").to route_to("socioeduk/ocorrencias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/ocorrencias/1").to route_to("socioeduk/ocorrencias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/ocorrencias/1").to route_to("socioeduk/ocorrencias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/ocorrencias/1").to route_to("socioeduk/ocorrencias#destroy", :id => "1")
    end
  end
end
