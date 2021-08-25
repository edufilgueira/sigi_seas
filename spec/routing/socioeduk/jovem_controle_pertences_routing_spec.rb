require "rails_helper"

RSpec.describe Socioeduk::JovemControlePertencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_controle_pertences").to route_to("socioeduk/jovem_controle_pertences#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_controle_pertences/new").to route_to("socioeduk/jovem_controle_pertences#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_controle_pertences/1").to route_to("socioeduk/jovem_controle_pertences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_controle_pertences/1/edit").to route_to("socioeduk/jovem_controle_pertences#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_controle_pertences").to route_to("socioeduk/jovem_controle_pertences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_controle_pertences/1").to route_to("socioeduk/jovem_controle_pertences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_controle_pertences/1").to route_to("socioeduk/jovem_controle_pertences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_controle_pertences/1").to route_to("socioeduk/jovem_controle_pertences#destroy", :id => "1")
    end
  end
end
