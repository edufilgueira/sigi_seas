require "rails_helper"

RSpec.describe Recursoshumanos::JustificativaAditivosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/recursoshumanos/justificativa_aditivos").to route_to("recursoshumanos/justificativa_aditivos#index")
    end

    it "routes to #new" do
      expect(:get => "/recursoshumanos/justificativa_aditivos/new").to route_to("recursoshumanos/justificativa_aditivos#new")
    end

    it "routes to #show" do
      expect(:get => "/recursoshumanos/justificativa_aditivos/1").to route_to("recursoshumanos/justificativa_aditivos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recursoshumanos/justificativa_aditivos/1/edit").to route_to("recursoshumanos/justificativa_aditivos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/recursoshumanos/justificativa_aditivos").to route_to("recursoshumanos/justificativa_aditivos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recursoshumanos/justificativa_aditivos/1").to route_to("recursoshumanos/justificativa_aditivos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recursoshumanos/justificativa_aditivos/1").to route_to("recursoshumanos/justificativa_aditivos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recursoshumanos/justificativa_aditivos/1").to route_to("recursoshumanos/justificativa_aditivos#destroy", :id => "1")
    end
  end
end
