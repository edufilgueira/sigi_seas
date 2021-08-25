require "rails_helper"

RSpec.describe GestaoDemandas::SolicitacoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/gestao_demandas/solicitacoes").to route_to("gestao_demandas/solicitacoes#index")
    end

    it "routes to #new" do
      expect(:get => "/gestao_demandas/solicitacoes/new").to route_to("gestao_demandas/solicitacoes#new")
    end

    it "routes to #show" do
      expect(:get => "/gestao_demandas/solicitacoes/1").to route_to("gestao_demandas/solicitacoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gestao_demandas/solicitacoes/1/edit").to route_to("gestao_demandas/solicitacoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gestao_demandas/solicitacoes").to route_to("gestao_demandas/solicitacoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gestao_demandas/solicitacoes/1").to route_to("gestao_demandas/solicitacoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gestao_demandas/solicitacoes/1").to route_to("gestao_demandas/solicitacoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gestao_demandas/solicitacoes/1").to route_to("gestao_demandas/solicitacoes#destroy", :id => "1")
    end
  end
end
