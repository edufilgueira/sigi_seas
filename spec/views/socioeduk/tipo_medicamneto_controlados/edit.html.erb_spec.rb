require 'rails_helper'

RSpec.describe "socioeduk/tipo_medicamento_controlados/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_medicamento_controlado = assign(:socioeduk_tipo_medicamento_controlado, Socioeduk::TipoMedicamentoControlado.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_medicamento_controlado form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_medicamento_controlado_path(@socioeduk_tipo_medicamento_controlado), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_medicamento_controlado[descricao]"
    end
  end
end
