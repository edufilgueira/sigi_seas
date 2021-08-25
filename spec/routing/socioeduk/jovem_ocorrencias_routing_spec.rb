require "rails_helper"

RSpec.describe Socioeduk::JovemOcorrenciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_ocorrencias").to route_to("socioeduk/jovem_ocorrencias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_ocorrencias/new").to route_to("socioeduk/jovem_ocorrencias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_ocorrencias/1").to route_to("socioeduk/jovem_ocorrencias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_ocorrencias/1/edit").to route_to("socioeduk/jovem_ocorrencias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_ocorrencias").to route_to("socioeduk/jovem_ocorrencias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_ocorrencias/1").to route_to("socioeduk/jovem_ocorrencias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_ocorrencias/1").to route_to("socioeduk/jovem_ocorrencias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_ocorrencias/1").to route_to("socioeduk/jovem_ocorrencias#destroy", :id => "1")
    end
  end
end
