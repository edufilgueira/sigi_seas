require 'rails_helper'

RSpec.describe "socioeduk/pedagogico_jovem_disciplina_escolaridades/new", type: :view do
  before(:each) do
    assign(:socioeduk_pedagogico_jovem_disciplina_escolaridade, Socioeduk::PedagogicoJovemDisciplinaEscolaridade.new(
      :socioeduk_pedagogico_jovem => nil,
      :socioeduk_disciplina_escolaridade => nil,
      :socioeduk_situacao_disciplina => nil,
      :observacao => "MyText"
    ))
  end

  xit "renders new socioeduk_pedagogico_jovem_disciplina_escolaridade form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_pedagogico_jovem_disciplina_escolaridades_path, "post" do

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_pedagogico_jovem_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_disciplina_escolaridade_id]"

      assert_select "input[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[socioeduk_situacao_disciplina_id]"

      assert_select "textarea[name=?]", "socioeduk_pedagogico_jovem_disciplina_escolaridade[observacao]"
    end
  end
end
