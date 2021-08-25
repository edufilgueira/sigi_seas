require "rails_helper"

RSpec.describe Recursoshumanos::AditivosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/recursoshumanos/aditivos").to route_to("recursoshumanos/aditivos#index")
    end

    it "routes to #new" do
      expect(:get => "/recursoshumanos/aditivos/new").to route_to("recursoshumanos/aditivos#new")
    end

    it "routes to #show" do
      expect(:get => "/recursoshumanos/aditivos/1").to route_to("recursoshumanos/aditivos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recursoshumanos/aditivos/1/edit").to route_to("recursoshumanos/aditivos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/recursoshumanos/aditivos").to route_to("recursoshumanos/aditivos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recursoshumanos/aditivos/1").to route_to("recursoshumanos/aditivos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recursoshumanos/aditivos/1").to route_to("recursoshumanos/aditivos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recursoshumanos/aditivos/1").to route_to("recursoshumanos/aditivos#destroy", :id => "1")
    end
  end
end
