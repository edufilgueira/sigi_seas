require "rails_helper"

RSpec.describe UnidadeSocioeducativaAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/unidade_socioeducativa_areas").to route_to("unidade_socioeducativa_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/unidade_socioeducativa_areas/new").to route_to("unidade_socioeducativa_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/unidade_socioeducativa_areas/1").to route_to("unidade_socioeducativa_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unidade_socioeducativa_areas/1/edit").to route_to("unidade_socioeducativa_areas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/unidade_socioeducativa_areas").to route_to("unidade_socioeducativa_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unidade_socioeducativa_areas/1").to route_to("unidade_socioeducativa_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unidade_socioeducativa_areas/1").to route_to("unidade_socioeducativa_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unidade_socioeducativa_areas/1").to route_to("unidade_socioeducativa_areas#destroy", :id => "1")
    end
  end
end
