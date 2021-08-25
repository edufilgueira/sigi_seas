require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemOcorrenciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_ocorrencias").to route_to("socioeduk/saude_jovem_ocorrencias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_ocorrencias/new").to route_to("socioeduk/saude_jovem_ocorrencias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_ocorrencias/1").to route_to("socioeduk/saude_jovem_ocorrencias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_ocorrencias/1/edit").to route_to("socioeduk/saude_jovem_ocorrencias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_ocorrencias").to route_to("socioeduk/saude_jovem_ocorrencias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_ocorrencias/1").to route_to("socioeduk/saude_jovem_ocorrencias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_ocorrencias/1").to route_to("socioeduk/saude_jovem_ocorrencias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_ocorrencias/1").to route_to("socioeduk/saude_jovem_ocorrencias#destroy", :id => "1")
    end
  end
end
