require "rails_helper"

RSpec.describe Socioeduk::MunicipiosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/municipios").to route_to("socioeduk/municipios#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/municipios/new").to route_to("socioeduk/municipios#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/municipios/1").to route_to("socioeduk/municipios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/municipios/1/edit").to route_to("socioeduk/municipios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/municipios").to route_to("socioeduk/municipios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/municipios/1").to route_to("socioeduk/municipios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/municipios/1").to route_to("socioeduk/municipios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/municipios/1").to route_to("socioeduk/municipios#destroy", :id => "1")
    end
  end
end
