require "rails_helper"

RSpec.describe Socioeduk::LocalAtendimentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/local_atendimentos").to route_to("socioeduk/local_atendimentos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/local_atendimentos/new").to route_to("socioeduk/local_atendimentos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/local_atendimentos/1").to route_to("socioeduk/local_atendimentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/local_atendimentos/1/edit").to route_to("socioeduk/local_atendimentos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/local_atendimentos").to route_to("socioeduk/local_atendimentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/local_atendimentos/1").to route_to("socioeduk/local_atendimentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/local_atendimentos/1").to route_to("socioeduk/local_atendimentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/local_atendimentos/1").to route_to("socioeduk/local_atendimentos#destroy", :id => "1")
    end
  end
end
