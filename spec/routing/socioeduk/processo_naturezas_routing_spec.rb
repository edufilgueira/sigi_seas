require "rails_helper"

RSpec.describe Socioeduk::ProcessoNaturezasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/processo_naturezas").to route_to("socioeduk/processo_naturezas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/processo_naturezas/new").to route_to("socioeduk/processo_naturezas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/processo_naturezas/1").to route_to("socioeduk/processo_naturezas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/processo_naturezas/1/edit").to route_to("socioeduk/processo_naturezas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/processo_naturezas").to route_to("socioeduk/processo_naturezas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/processo_naturezas/1").to route_to("socioeduk/processo_naturezas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/processo_naturezas/1").to route_to("socioeduk/processo_naturezas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/processo_naturezas/1").to route_to("socioeduk/processo_naturezas#destroy", :id => "1")
    end
  end
end
