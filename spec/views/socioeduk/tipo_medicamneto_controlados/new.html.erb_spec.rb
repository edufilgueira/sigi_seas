require 'rails_helper'

RSpec.describe "socioeduk/tipo_medicamento_controlados/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_medicamento_controlado, Socioeduk::TipoMedicamentoControlado.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_medicamento_controlado form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_medicamento_controlados_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_medicamento_controlado[descricao]"
    end
  end
end
