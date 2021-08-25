require "rails_helper"

RSpec.describe Biblioteca::LivrosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/biblioteca/livros").to route_to("biblioteca/livros#index")
    end

    it "routes to #new" do
      expect(:get => "/biblioteca/livros/new").to route_to("biblioteca/livros#new")
    end

    it "routes to #show" do
      expect(:get => "/biblioteca/livros/1").to route_to("biblioteca/livros#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biblioteca/livros/1/edit").to route_to("biblioteca/livros#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/biblioteca/livros").to route_to("biblioteca/livros#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/biblioteca/livros/1").to route_to("biblioteca/livros#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/biblioteca/livros/1").to route_to("biblioteca/livros#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biblioteca/livros/1").to route_to("biblioteca/livros#destroy", :id => "1")
    end
  end
end
