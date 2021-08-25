require "rails_helper"

RSpec.describe Socioeduk::JovemTransferenciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_transferencias").to route_to("socioeduk/jovem_transferencias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_transferencias/new").to route_to("socioeduk/jovem_transferencias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_transferencias/1").to route_to("socioeduk/jovem_transferencias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_transferencias/1/edit").to route_to("socioeduk/jovem_transferencias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_transferencias").to route_to("socioeduk/jovem_transferencias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_transferencias/1").to route_to("socioeduk/jovem_transferencias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_transferencias/1").to route_to("socioeduk/jovem_transferencias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_transferencias/1").to route_to("socioeduk/jovem_transferencias#destroy", :id => "1")
    end
  end
end
