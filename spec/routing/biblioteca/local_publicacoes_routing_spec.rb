require "rails_helper"

RSpec.describe Biblioteca::LocalPublicacoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/local_publicacoes").to route_to("biblioteca/local_publicacoes#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/local_publicacoes/new").to route_to("biblioteca/local_publicacoes#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/local_publicacoes/1").to route_to("biblioteca/local_publicacoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/local_publicacoes/1/edit").to route_to("biblioteca/local_publicacoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/local_publicacoes").to route_to("biblioteca/local_publicacoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/local_publicacoes/1").to route_to("biblioteca/local_publicacoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/local_publicacoes/1").to route_to("biblioteca/local_publicacoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/local_publicacoes/1").to route_to("biblioteca/local_publicacoes#destroy", :id => "1")
    end
  end
end
