require "rails_helper"

RSpec.describe Socioeduk::SituacaoCumprimentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/situacao_cumprimentos").to route_to("socioeduk/situacao_cumprimentos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/situacao_cumprimentos/new").to route_to("socioeduk/situacao_cumprimentos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/situacao_cumprimentos/1").to route_to("socioeduk/situacao_cumprimentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/situacao_cumprimentos/1/edit").to route_to("socioeduk/situacao_cumprimentos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/situacao_cumprimentos").to route_to("socioeduk/situacao_cumprimentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/situacao_cumprimentos/1").to route_to("socioeduk/situacao_cumprimentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/situacao_cumprimentos/1").to route_to("socioeduk/situacao_cumprimentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/situacao_cumprimentos/1").to route_to("socioeduk/situacao_cumprimentos#destroy", :id => "1")
    end
  end
end
