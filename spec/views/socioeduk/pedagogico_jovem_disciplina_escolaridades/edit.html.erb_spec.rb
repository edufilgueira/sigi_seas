require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridades/edit", type: :view do
  before(:each) do
    @socioeduk_pedagogico_jovem_disciplina_escolaridade = assign(:socioeduk_pedagogico_jovem_disciplina_escolaridade, Socioeduk::PedagogicoJovemDisciplinaEscolaridade.create!(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_disciplina_escolaridade => nil,
      :socioeduk_situacao_disciplina => nil,
      :observacao => "MyText"
    ))
  end

  xit "renders the edit socioeduk_pedagogico_jovem_disciplina_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_disciplina_escolaridade_path(@socioeduk_pedagogico_jovem_disciplina_escolaridade), "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_pedagogico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_disciplina_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_situacao_disciplina_id]"

      assert_select "textarea[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[observacao]"
    end
  end
end
