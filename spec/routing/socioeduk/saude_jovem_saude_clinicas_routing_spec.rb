require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemSaudeClinicasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_saude_clinicas").to route_to("socioeduk/saude_jovem_saude_clinicas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_saude_clinicas/new").to route_to("socioeduk/saude_jovem_saude_clinicas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_saude_clinicas/1").to route_to("socioeduk/saude_jovem_saude_clinicas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_saude_clinicas/1/edit").to route_to("socioeduk/saude_jovem_saude_clinicas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_saude_clinicas").to route_to("socioeduk/saude_jovem_saude_clinicas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_saude_clinicas/1").to route_to("socioeduk/saude_jovem_saude_clinicas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_saude_clinicas/1").to route_to("socioeduk/saude_jovem_saude_clinicas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_saude_clinicas/1").to route_to("socioeduk/saude_jovem_saude_clinicas#destroy", :id => "1")
    end

  end
end
