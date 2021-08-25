require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemVacinasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_vacinas").to route_to("socioeduk/saude_jovem_vacinas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_vacinas/new").to route_to("socioeduk/saude_jovem_vacinas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_vacinas/1").to route_to("socioeduk/saude_jovem_vacinas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_vacinas/1/edit").to route_to("socioeduk/saude_jovem_vacinas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_vacinas").to route_to("socioeduk/saude_jovem_vacinas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_vacinas/1").to route_to("socioeduk/saude_jovem_vacinas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_vacinas/1").to route_to("socioeduk/saude_jovem_vacinas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_vacinas/1").to route_to("socioeduk/saude_jovem_vacinas#destroy", :id => "1")
    end

  end
end
