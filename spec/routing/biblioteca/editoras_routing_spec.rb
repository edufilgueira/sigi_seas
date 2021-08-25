require "rails_helper"

RSpec.describe Biblioteca::EditorasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/editoras").to route_to("biblioteca/editoras#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/editoras/new").to route_to("biblioteca/editoras#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/editoras/1").to route_to("biblioteca/editoras#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/editoras/1/edit").to route_to("biblioteca/editoras#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/editoras").to route_to("biblioteca/editoras#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/editoras/1").to route_to("biblioteca/editoras#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/editoras/1").to route_to("biblioteca/editoras#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/editoras/1").to route_to("biblioteca/editoras#destroy", :id => "1")
    end
  end
end
