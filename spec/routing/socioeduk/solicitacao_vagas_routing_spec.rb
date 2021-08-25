require "rails_helper"

RSpec.describe Socioeduk::SolicitacaoVagasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/solicitacao_vagas").to route_to("socioeduk/solicitacao_vagas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/solicitacao_vagas/new").to route_to("socioeduk/solicitacao_vagas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/solicitacao_vagas/1").to route_to("socioeduk/solicitacao_vagas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/solicitacao_vagas/1/edit").to route_to("socioeduk/solicitacao_vagas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/solicitacao_vagas").to route_to("socioeduk/solicitacao_vagas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/solicitacao_vagas/1").to route_to("socioeduk/solicitacao_vagas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/solicitacao_vagas/1").to route_to("socioeduk/solicitacao_vagas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/solicitacao_vagas/1").to route_to("socioeduk/solicitacao_vagas#destroy", :id => "1")
    end
  end
end
