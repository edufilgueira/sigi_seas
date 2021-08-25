require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemExamesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_exames").to route_to("socioeduk/saude_jovem_exames#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_exames/new").to route_to("socioeduk/saude_jovem_exames#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_exames/1").to route_to("socioeduk/saude_jovem_exames#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_exames/1/edit").to route_to("socioeduk/saude_jovem_exames#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_exames").to route_to("socioeduk/saude_jovem_exames#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_exames/1").to route_to("socioeduk/saude_jovem_exames#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_exames/1").to route_to("socioeduk/saude_jovem_exames#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_exames/1").to route_to("socioeduk/saude_jovem_exames#destroy", :id => "1")
    end

  end
end
