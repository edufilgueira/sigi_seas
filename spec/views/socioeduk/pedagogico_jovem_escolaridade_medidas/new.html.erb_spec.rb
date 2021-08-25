require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_escolaridade_medidas/new", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_escolaridade_medida, Socioeduk::PedagogicoJovemEscolaridadeMedida.new(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_escolaridade => nil,
      :socioeduk_tipo_local_curso => nil,
      :escola => "MyString",
      :ano => 1
    ))
  end

  xit "renders new socioeduk_pedagogico_jovem_escolaridade_medida form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_escolaridade_medidas_path, "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_escolaridade_medida[socioeduk_pedagogico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_escolaridade_medida[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_escolaridade_medida[socioeduk_tipo_local_curso_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_escolaridade_medida[escola]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_escolaridade_medida[ano]"
    end
  end
end
