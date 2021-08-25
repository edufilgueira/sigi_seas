require 'rails_helper'

RSpec.describe "socioeduk/tipo_medicamento_controlados/show", type: :view do
  before(:each) do
    @socioeduk_tipo_medicamento_controlado = assign(:socioeduk_tipo_medicamento_controlado, Socioeduk::TipoMedicamentoControlado.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
