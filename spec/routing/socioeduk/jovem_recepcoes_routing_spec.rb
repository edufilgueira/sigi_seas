require "rails_helper"

RSpec.describe Socioeduk::JovemRecepcoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_recepcoes").to route_to("socioeduk/jovem_recepcoes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_recepcoes/new").to route_to("socioeduk/jovem_recepcoes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_recepcoes/1").to route_to("socioeduk/jovem_recepcoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_recepcoes/1/edit").to route_to("socioeduk/jovem_recepcoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_recepcoes").to route_to("socioeduk/jovem_recepcoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_recepcoes/1").to route_to("socioeduk/jovem_recepcoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_recepcoes/1").to route_to("socioeduk/jovem_recepcoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_recepcoes/1").to route_to("socioeduk/jovem_recepcoes#destroy", :id => "1")
    end
  end
end
