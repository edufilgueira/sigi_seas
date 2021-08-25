require "rails_helper"

RSpec.describe Socioeduk::ProcessoAdvogadosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/processo_advogados").to route_to("socioeduk/processo_advogados#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/processo_advogados/new").to route_to("socioeduk/processo_advogados#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/processo_advogados/1").to route_to("socioeduk/processo_advogados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/processo_advogados/1/edit").to route_to("socioeduk/processo_advogados#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/processo_advogados").to route_to("socioeduk/processo_advogados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/processo_advogados/1").to route_to("socioeduk/processo_advogados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/processo_advogados/1").to route_to("socioeduk/processo_advogados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/processo_advogados/1").to route_to("socioeduk/processo_advogados#destroy", :id => "1")
    end
  end
end
