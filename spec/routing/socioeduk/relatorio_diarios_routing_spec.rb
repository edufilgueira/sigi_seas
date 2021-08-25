require "rails_helper"

RSpec.describe Socioeduk::RelatorioDiariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/relatorio_diarios").to route_to("socioeduk/relatorio_diarios#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/relatorio_diarios/new").to route_to("socioeduk/relatorio_diarios#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/relatorio_diarios/1").to route_to("socioeduk/relatorio_diarios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/relatorio_diarios/1/edit").to route_to("socioeduk/relatorio_diarios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/relatorio_diarios").to route_to("socioeduk/relatorio_diarios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/relatorio_diarios/1").to route_to("socioeduk/relatorio_diarios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/relatorio_diarios/1").to route_to("socioeduk/relatorio_diarios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/relatorio_diarios/1").to route_to("socioeduk/relatorio_diarios#destroy", :id => "1")
    end
  end
end
