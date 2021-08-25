require "rails_helper"

RSpec.describe Socioeduk::JovemApreensoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/jovem_apreensoes").to route_to("socioeduk/jovem_apreensoes#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/jovem_apreensoes/new").to route_to("socioeduk/jovem_apreensoes#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/jovem_apreensoes/1").to route_to("socioeduk/jovem_apreensoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/jovem_apreensoes/1/edit").to route_to("socioeduk/jovem_apreensoes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/jovem_apreensoes").to route_to("socioeduk/jovem_apreensoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/jovem_apreensoes/1").to route_to("socioeduk/jovem_apreensoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/jovem_apreensoes/1").to route_to("socioeduk/jovem_apreensoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/jovem_apreensoes/1").to route_to("socioeduk/jovem_apreensoes#destroy", :id => "1")
    end
  end
end
