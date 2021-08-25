require "rails_helper"

RSpec.describe Socioeduk::ArtigoInfracoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/artigo_infracoes").to route_to("socioeduk/artigo_infracoes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/artigo_infracoes/new").to route_to("socioeduk/artigo_infracoes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/artigo_infracoes/1").to route_to("socioeduk/artigo_infracoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/artigo_infracoes/1/edit").to route_to("socioeduk/artigo_infracoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/artigo_infracoes").to route_to("socioeduk/artigo_infracoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/artigo_infracoes/1").to route_to("socioeduk/artigo_infracoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/artigo_infracoes/1").to route_to("socioeduk/artigo_infracoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/artigo_infracoes/1").to route_to("socioeduk/artigo_infracoes#destroy", :id => "1")
    end
  end
end
