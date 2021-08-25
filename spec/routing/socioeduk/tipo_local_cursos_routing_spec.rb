require "rails_helper"

RSpec.describe Socioeduk::TipoLocalCursosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_local_cursos").to route_to("socioeduk/tipo_local_cursos#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_local_cursos/new").to route_to("socioeduk/tipo_local_cursos#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_local_cursos/1").to route_to("socioeduk/tipo_local_cursos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_local_cursos/1/edit").to route_to("socioeduk/tipo_local_cursos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_local_cursos").to route_to("socioeduk/tipo_local_cursos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_local_cursos/1").to route_to("socioeduk/tipo_local_cursos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_local_cursos/1").to route_to("socioeduk/tipo_local_cursos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_local_cursos/1").to route_to("socioeduk/tipo_local_cursos#destroy", :id => "1")
    end
  end
end
