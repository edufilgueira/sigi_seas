require "rails_helper"

RSpec.describe Socioeduk::TecnicoJovemAnexosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tecnico_jovem_anexos").to route_to("socioeduk/tecnico_jovem_anexos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tecnico_jovem_anexos/new").to route_to("socioeduk/tecnico_jovem_anexos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tecnico_jovem_anexos/1").to route_to("socioeduk/tecnico_jovem_anexos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tecnico_jovem_anexos/1/edit").to route_to("socioeduk/tecnico_jovem_anexos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tecnico_jovem_anexos").to route_to("socioeduk/tecnico_jovem_anexos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tecnico_jovem_anexos/1").to route_to("socioeduk/tecnico_jovem_anexos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tecnico_jovem_anexos/1").to route_to("socioeduk/tecnico_jovem_anexos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tecnico_jovem_anexos/1").to route_to("socioeduk/tecnico_jovem_anexos#destroy", :id => "1")
    end
  end
end
