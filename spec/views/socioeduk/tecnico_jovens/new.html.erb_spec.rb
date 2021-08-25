require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovens/new", type: :view do
  before(:each) do
    assign(:socioeduk_tecnico_jovem, Socioeduk::TecnicoJovem.new(
      :socioeduk_jovem => nil,
      :tem_filhos => false,
      :quantos_filhos => 1,
      :socioeduk_convivio_familiar => nil,
      :codigo_familiar => "MyString",
      :cnis => "MyString",
      :programas_sociais => false,
      :socioeduk_renda_familiar => nil,
      :socioeduk_composicao_familiar => nil,
      :socioeduk_plano_individual_atendimento => nil,
      :nome_tecnico => "MyString",
      :profissional_referencia => "MyString"
    ))
  end

  xit "renders new socioeduk_tecnico_jovem form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tecnico_jovens_path, "post" do

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[tem_filhos]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[quantos_filhos]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[socioeduk_convivio_familiar_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[codigo_familiar]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[cnis]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[programas_sociais]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[socioeduk_renda_familiar_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[socioeduk_composicao_familiar_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[socioeduk_plano_individual_atendimento_id]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[nome_tecnico]"

      assert_select "input[name=?]", "socioeduk_tecnico_jovem[profissional_referencia]"
    end
  end
end
