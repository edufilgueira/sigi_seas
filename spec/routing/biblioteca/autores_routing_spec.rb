require "rails_helper"

RSpec.describe Biblioteca::AutoresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/autores").to route_to("biblioteca/autores#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/autores/new").to route_to("biblioteca/autores#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/autores/1").to route_to("biblioteca/autores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/autores/1/edit").to route_to("biblioteca/autores#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/autores").to route_to("biblioteca/autores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/autores/1").to route_to("biblioteca/autores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/autores/1").to route_to("biblioteca/autores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/autores/1").to route_to("biblioteca/autores#destroy", :id => "1")
    end
  end
end
