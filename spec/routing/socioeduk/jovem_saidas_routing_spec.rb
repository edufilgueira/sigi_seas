require "rails_helper"

RSpec.describe Socioeduk::JovemSaidasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_saidas").to route_to("socioeduk/jovem_saidas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_saidas/new").to route_to("socioeduk/jovem_saidas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_saidas/1").to route_to("socioeduk/jovem_saidas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_saidas/1/edit").to route_to("socioeduk/jovem_saidas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_saidas").to route_to("socioeduk/jovem_saidas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_saidas/1").to route_to("socioeduk/jovem_saidas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_saidas/1").to route_to("socioeduk/jovem_saidas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_saidas/1").to route_to("socioeduk/jovem_saidas#destroy", :id => "1")
    end
  end
end
