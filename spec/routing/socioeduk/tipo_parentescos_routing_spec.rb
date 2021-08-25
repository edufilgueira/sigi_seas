require "rails_helper"

RSpec.describe Socioeduk::TipoParentescosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_parentescos").to route_to("socioeduk/tipo_parentescos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_parentescos/new").to route_to("socioeduk/tipo_parentescos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_parentescos/1").to route_to("socioeduk/tipo_parentescos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_parentescos/1/edit").to route_to("socioeduk/tipo_parentescos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_parentescos").to route_to("socioeduk/tipo_parentescos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_parentescos/1").to route_to("socioeduk/tipo_parentescos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_parentescos/1").to route_to("socioeduk/tipo_parentescos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_parentescos/1").to route_to("socioeduk/tipo_parentescos#destroy", :id => "1")
    end

  end
end
