require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridade_medidas/edit", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_disciplina_escolaridade_medida = assign(:socioeduk_pedagogico_jovem_disciplina_escolaridade_medida, Socioeduk::PedagogicoJovemDisciplinaEscolaridadeMedida.create!(
      :socioeduk_pedagogico_jovem_escolaridade_medida => nil,
      :socioeduk_escolaridade => nil,
      :socioeduk_situacao_disciplina => nil,
      :observacao => "MyText"
    ))
  end

  xit "renders the edit socioeduk_pedagogico_jovem_disciplina_escolaridade_medida form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_disciplina_escolaridade_medida_path(@socioeduk_pedagogico_jovem_disciplina_escolaridade_medida), "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade_medida[socioeduk_pedagogico_jovem_escolaridade_medida_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade_medida[socioeduk_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade_medida[socioeduk_situacao_disciplina_id]"

      assert_select "textarea[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade_medida[observacao]"
    end
  end
end
