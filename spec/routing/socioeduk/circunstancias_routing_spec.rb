require "rails_helper"

RSpec.describe Socioeduk::CircunstanciasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/circunstancias").to route_to("socioeduk/circunstancias#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/circunstancias/new").to route_to("socioeduk/circunstancias#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/circunstancias/1").to route_to("socioeduk/circunstancias#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/circunstancias/1/edit").to route_to("socioeduk/circunstancias#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/circunstancias").to route_to("socioeduk/circunstancias#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/circunstancias/1").to route_to("socioeduk/circunstancias#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/circunstancias/1").to route_to("socioeduk/circunstancias#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/circunstancias/1").to route_to("socioeduk/circunstancias#destroy", :id => "1")
    end
  end
end
