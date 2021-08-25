require "rails_helper"

RSpec.describe Socioeduk::TipoVacinasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_vacinas").to route_to("socioeduk/tipo_vacinas#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_vacinas/new").to route_to("socioeduk/tipo_vacinas#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_vacinas/1").to route_to("socioeduk/tipo_vacinas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_vacinas/1/edit").to route_to("socioeduk/tipo_vacinas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_vacinas").to route_to("socioeduk/tipo_vacinas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_vacinas/1").to route_to("socioeduk/tipo_vacinas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_vacinas/1").to route_to("socioeduk/tipo_vacinas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_vacinas/1").to route_to("socioeduk/tipo_vacinas#destroy", :id => "1")
    end

  end
end
