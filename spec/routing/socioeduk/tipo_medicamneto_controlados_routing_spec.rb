require "rails_helper"

RSpec.describe Socioeduk::TipoMedicamentoControladosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socioeduk/tipo_medicamento_controlados").to route_to("socioeduk/tipo_medicamento_controlados#index")
    end

    it "routes to #new" do
      expect(:get => "/socioeduk/tipo_medicamento_controlados/new").to route_to("socioeduk/tipo_medicamento_controlados#new")
    end

    it "routes to #show" do
      expect(:get => "/socioeduk/tipo_medicamento_controlados/1").to route_to("socioeduk/tipo_medicamento_controlados#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socioeduk/tipo_medicamento_controlados/1/edit").to route_to("socioeduk/tipo_medicamento_controlados#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socioeduk/tipo_medicamento_controlados").to route_to("socioeduk/tipo_medicamento_controlados#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socioeduk/tipo_medicamento_controlados/1").to route_to("socioeduk/tipo_medicamento_controlados#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socioeduk/tipo_medicamento_controlados/1").to route_to("socioeduk/tipo_medicamento_controlados#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socioeduk/tipo_medicamento_controlados/1").to route_to("socioeduk/tipo_medicamento_controlados#destroy", :id => "1")
    end

  end
end
