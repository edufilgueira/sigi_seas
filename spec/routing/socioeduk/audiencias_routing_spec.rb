require "rails_helper"

RSpec.describe Socioeduk::AudienciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/audiencias").to route_to("socioeduk/audiencias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/audiencias/new").to route_to("socioeduk/audiencias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/audiencias/1").to route_to("socioeduk/audiencias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/audiencias/1/edit").to route_to("socioeduk/audiencias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/audiencias").to route_to("socioeduk/audiencias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/audiencias/1").to route_to("socioeduk/audiencias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/audiencias/1").to route_to("socioeduk/audiencias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/audiencias/1").to route_to("socioeduk/audiencias#destroy", :id => "1")
    end
  end
end
