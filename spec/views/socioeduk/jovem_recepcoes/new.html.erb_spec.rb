require 'rails_helper'

RSpec.describe "socioeduk/jovem_recepcoes/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_recepcao, Socioeduk::JovemRecepcao.new(
      :socioeduk_jovem => nil,
      :antecedentes => false,
      :bo => "MyString",
      :responsavel => false,
      :nome_responsavel => "MyString",
      :telefone => "MyString",
      :presenca_familiar_junto => "MyString",
      :condutor_nome => "MyString",
      :condutor_documento => "MyString",
      :condutor_cargo => "MyString",
      :datahora_apresentacao => "MyString",
      :oficio => false,
      :documentos_pessoais => false,
      :decisao => false,
      :corpo_delito => false,
      :certidao_antecedente_criminal => false,
      :kit_vestuario => false
    ))
  end

  it "renders new socioeduk_jovem_recepcao form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_recepcoes_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[antecedentes]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[bo]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[responsavel]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[nome_responsavel]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[telefone]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[presenca_familiar_junto]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[condutor_nome]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[condutor_documento]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[condutor_cargo]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[datahora_apresentacao]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[oficio]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[documentos_pessoais]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[decisao]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[corpo_delito]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[certidao_antecedente_criminal]"

      assert_select "input[name=?]", "socioeduk_jovem_recepcao[kit_vestuario]"
    end
  end
end
