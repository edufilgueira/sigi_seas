require "rails_helper"

RSpec.describe Socioeduk::SituacaoOcupacionaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_ocupacionais").to route_to("socioeduk/situacao_ocupacionais#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_ocupacionais/new").to route_to("socioeduk/situacao_ocupacionais#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_ocupacionais/1").to route_to("socioeduk/situacao_ocupacionais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_ocupacionais/1/edit").to route_to("socioeduk/situacao_ocupacionais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_ocupacionais").to route_to("socioeduk/situacao_ocupacionais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_ocupacionais/1").to route_to("socioeduk/situacao_ocupacionais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_ocupacionais/1").to route_to("socioeduk/situacao_ocupacionais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_ocupacionais/1").to route_to("socioeduk/situacao_ocupacionais#destroy", :id => "1")
    end
  end
end
