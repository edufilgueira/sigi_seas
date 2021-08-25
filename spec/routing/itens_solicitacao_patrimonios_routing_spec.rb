require "rails_helper"

RSpec.describe ItensSolicitacaoPatrimoniosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/itens_solicitacao_patrimonios").to route_to("itens_solicitacao_patrimonios#index")
    end

    it "routes to #new" do
      expect(:get => "/itens_solicitacao_patrimonios/new").to route_to("itens_solicitacao_patrimonios#new")
    end

    it "routes to #show" do
      expect(:get => "/itens_solicitacao_patrimonios/1").to route_to("itens_solicitacao_patrimonios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/itens_solicitacao_patrimonios/1/edit").to route_to("itens_solicitacao_patrimonios#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/itens_solicitacao_patrimonios").to route_to("itens_solicitacao_patrimonios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/itens_solicitacao_patrimonios/1").to route_to("itens_solicitacao_patrimonios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/itens_solicitacao_patrimonios/1").to route_to("itens_solicitacao_patrimonios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/itens_solicitacao_patrimonios/1").to route_to("itens_solicitacao_patrimonios#destroy", :id => "1")
    end
  end
end
