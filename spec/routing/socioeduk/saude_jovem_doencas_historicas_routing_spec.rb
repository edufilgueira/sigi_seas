require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemDoencasHistoricasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_doencas_historicas").to route_to("socioeduk/saude_jovem_doencas_historicas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_doencas_historicas/new").to route_to("socioeduk/saude_jovem_doencas_historicas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_doencas_historicas/1").to route_to("socioeduk/saude_jovem_doencas_historicas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_doencas_historicas/1/edit").to route_to("socioeduk/saude_jovem_doencas_historicas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_doencas_historicas").to route_to("socioeduk/saude_jovem_doencas_historicas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_doencas_historicas/1").to route_to("socioeduk/saude_jovem_doencas_historicas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_doencas_historicas/1").to route_to("socioeduk/saude_jovem_doencas_historicas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_doencas_historicas/1").to route_to("socioeduk/saude_jovem_doencas_historicas#destroy", :id => "1")
    end

  end
end
