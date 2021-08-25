require "rails_helper"

RSpec.describe Recursoshumanos::CargoAditivosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/recursoshumanos/cargo_aditivos").to route_to("recursoshumanos/cargo_aditivos#index")
    end

    it "routes to #new" do
      expect(:get => "/recursoshumanos/cargo_aditivos/new").to route_to("recursoshumanos/cargo_aditivos#new")
    end

    it "routes to #show" do
      expect(:get => "/recursoshumanos/cargo_aditivos/1").to route_to("recursoshumanos/cargo_aditivos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recursoshumanos/cargo_aditivos/1/edit").to route_to("recursoshumanos/cargo_aditivos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/recursoshumanos/cargo_aditivos").to route_to("recursoshumanos/cargo_aditivos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recursoshumanos/cargo_aditivos/1").to route_to("recursoshumanos/cargo_aditivos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recursoshumanos/cargo_aditivos/1").to route_to("recursoshumanos/cargo_aditivos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recursoshumanos/cargo_aditivos/1").to route_to("recursoshumanos/cargo_aditivos#destroy", :id => "1")
    end
  end
end
