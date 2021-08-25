require "rails_helper"

RSpec.describe Socioeduk::ProcessoRecepcaoJovemInfracoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/processo_recepcao_jovem_infracoes").to route_to("socioeduk/processo_recepcao_jovem_infracoes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/processo_recepcao_jovem_infracoes/new").to route_to("socioeduk/processo_recepcao_jovem_infracoes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/processo_recepcao_jovem_infracoes/1").to route_to("socioeduk/processo_recepcao_jovem_infracoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/processo_recepcao_jovem_infracoes/1/edit").to route_to("socioeduk/processo_recepcao_jovem_infracoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/processo_recepcao_jovem_infracoes").to route_to("socioeduk/processo_recepcao_jovem_infracoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/processo_recepcao_jovem_infracoes/1").to route_to("socioeduk/processo_recepcao_jovem_infracoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/processo_recepcao_jovem_infracoes/1").to route_to("socioeduk/processo_recepcao_jovem_infracoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/processo_recepcao_jovem_infracoes/1").to route_to("socioeduk/processo_recepcao_jovem_infracoes#destroy", :id => "1")
    end
  end
end
