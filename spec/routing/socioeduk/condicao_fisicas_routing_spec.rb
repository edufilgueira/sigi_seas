require "rails_helper"

RSpec.describe Socioeduk::CondicaoFisicasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/condicao_fisicas").to route_to("socioeduk/condicao_fisicas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/condicao_fisicas/new").to route_to("socioeduk/condicao_fisicas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/condicao_fisicas/1").to route_to("socioeduk/condicao_fisicas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/condicao_fisicas/1/edit").to route_to("socioeduk/condicao_fisicas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/condicao_fisicas").to route_to("socioeduk/condicao_fisicas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/condicao_fisicas/1").to route_to("socioeduk/condicao_fisicas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/condicao_fisicas/1").to route_to("socioeduk/condicao_fisicas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/condicao_fisicas/1").to route_to("socioeduk/condicao_fisicas#destroy", :id => "1")
    end

  end
end
