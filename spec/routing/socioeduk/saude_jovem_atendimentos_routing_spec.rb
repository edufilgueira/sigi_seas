require "rails_helper"

RSpec.describe Socioeduk::SaudeJovemAtendimentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/saude_jovem_atendimentos").to route_to("socioeduk/saude_jovem_atendimentos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/saude_jovem_atendimentos/new").to route_to("socioeduk/saude_jovem_atendimentos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/saude_jovem_atendimentos/1").to route_to("socioeduk/saude_jovem_atendimentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/saude_jovem_atendimentos/1/edit").to route_to("socioeduk/saude_jovem_atendimentos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/saude_jovem_atendimentos").to route_to("socioeduk/saude_jovem_atendimentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/saude_jovem_atendimentos/1").to route_to("socioeduk/saude_jovem_atendimentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/saude_jovem_atendimentos/1").to route_to("socioeduk/saude_jovem_atendimentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/saude_jovem_atendimentos/1").to route_to("socioeduk/saude_jovem_atendimentos#destroy", :id => "1")
    end

  end
end
