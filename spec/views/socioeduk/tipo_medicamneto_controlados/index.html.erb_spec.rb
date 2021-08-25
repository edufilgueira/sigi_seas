require 'rails_helper'

RSpec.describe "socioeduk/tipo_medicamento_controlados/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_medicamento_controlados, [
      Socioeduk::TipoMedicamentoControlado.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoMedicamentoControlado.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_medicamento_controlados" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
