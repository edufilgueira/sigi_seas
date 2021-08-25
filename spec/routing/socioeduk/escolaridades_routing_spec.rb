require "rails_helper"

RSpec.describe Socioeduk::EscolaridadesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/escolaridades").to route_to("socioeduk/escolaridades#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/escolaridades/new").to route_to("socioeduk/escolaridades#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/escolaridades/1").to route_to("socioeduk/escolaridades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/escolaridades/1/edit").to route_to("socioeduk/escolaridades#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/escolaridades").to route_to("socioeduk/escolaridades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/escolaridades/1").to route_to("socioeduk/escolaridades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/escolaridades/1").to route_to("socioeduk/escolaridades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/escolaridades/1").to route_to("socioeduk/escolaridades#destroy", :id => "1")
    end
  end
end
