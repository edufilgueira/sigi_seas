require "rails_helper"

RSpec.describe UnidadeBlocoDormitoriosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/unidade_bloco_dormitorios").to route_to("unidade_bloco_dormitorios#index")
    end

    it "routes to #new" do
      expect(:get => "/unidade_bloco_dormitorios/new").to route_to("unidade_bloco_dormitorios#new")
    end

    it "routes to #show" do
      expect(:get => "/unidade_bloco_dormitorios/1").to route_to("unidade_bloco_dormitorios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unidade_bloco_dormitorios/1/edit").to route_to("unidade_bloco_dormitorios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/unidade_bloco_dormitorios").to route_to("unidade_bloco_dormitorios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unidade_bloco_dormitorios/1").to route_to("unidade_bloco_dormitorios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unidade_bloco_dormitorios/1").to route_to("unidade_bloco_dormitorios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unidade_bloco_dormitorios/1").to route_to("unidade_bloco_dormitorios#destroy", :id => "1")
    end
  end
end
