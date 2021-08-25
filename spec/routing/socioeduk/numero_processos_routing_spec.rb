require "rails_helper"

RSpec.describe Socioeduk::NumeroProcessosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/numero_processos").to route_to("socioeduk/numero_processos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/numero_processos/new").to route_to("socioeduk/numero_processos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/numero_processos/1").to route_to("socioeduk/numero_processos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/numero_processos/1/edit").to route_to("socioeduk/numero_processos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/numero_processos").to route_to("socioeduk/numero_processos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/numero_processos/1").to route_to("socioeduk/numero_processos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/numero_processos/1").to route_to("socioeduk/numero_processos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/numero_processos/1").to route_to("socioeduk/numero_processos#destroy", :id => "1")
    end
  end
end
