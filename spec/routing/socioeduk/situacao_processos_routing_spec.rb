require "rails_helper"

RSpec.describe Socioeduk::SituacaoProcessosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_processos").to route_to("socioeduk/situacao_processos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_processos/new").to route_to("socioeduk/situacao_processos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_processos/1").to route_to("socioeduk/situacao_processos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_processos/1/edit").to route_to("socioeduk/situacao_processos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_processos").to route_to("socioeduk/situacao_processos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_processos/1").to route_to("socioeduk/situacao_processos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_processos/1").to route_to("socioeduk/situacao_processos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_processos/1").to route_to("socioeduk/situacao_processos#destroy", :id => "1")
    end
  end
end
