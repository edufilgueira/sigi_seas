require "rails_helper"

RSpec.describe UnidadeSocioeducativaBlocosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/unidade_socioeducativa_blocos").to route_to("unidade_socioeducativa_blocos#index")
    end

    it "routes to #new" do
      expect(:get => "/unidade_socioeducativa_blocos/new").to route_to("unidade_socioeducativa_blocos#new")
    end

    it "routes to #show" do
      expect(:get => "/unidade_socioeducativa_blocos/1").to route_to("unidade_socioeducativa_blocos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unidade_socioeducativa_blocos/1/edit").to route_to("unidade_socioeducativa_blocos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/unidade_socioeducativa_blocos").to route_to("unidade_socioeducativa_blocos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unidade_socioeducativa_blocos/1").to route_to("unidade_socioeducativa_blocos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unidade_socioeducativa_blocos/1").to route_to("unidade_socioeducativa_blocos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unidade_socioeducativa_blocos/1").to route_to("unidade_socioeducativa_blocos#destroy", :id => "1")
    end
  end
end
