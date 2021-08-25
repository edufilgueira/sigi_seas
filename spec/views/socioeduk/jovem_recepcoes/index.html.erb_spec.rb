require 'rails_helper'

RSpec.describe "socioeduk/jovem_recepcoes/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_recepcoes, [
      Socioeduk::JovemRecepcao.create!(
        :socioeduk_jovem => nil,
        :antecedentes => false,
        :bo => "Bo",
        :responsavel => false,
        :nome_responsavel => "Nome Responsavel",
        :telefone => "Telefone",
        :presenca_familiar_junto => "Presenca Familiar Junto",
        :condutor_nome => "Condutor Nome",
        :condutor_documento => "Condutor Documento",
        :condutor_cargo => "Condutor Cargo",
        :datahora_apresentacao => "Datahora Apresentacao",
        :oficio => false,
        :documentos_pessoais => false,
        :decisao => false,
        :corpo_delito => false,
        :certidao_antecedente_criminal => false,
        :kit_vestuario => false
      ),
      Socioeduk::JovemRecepcao.create!(
        :socioeduk_jovem => nil,
        :antecedentes => false,
        :bo => "Bo",
        :responsavel => false,
        :nome_responsavel => "Nome Responsavel",
        :telefone => "Telefone",
        :presenca_familiar_junto => "Presenca Familiar Junto",
        :condutor_nome => "Condutor Nome",
        :condutor_documento => "Condutor Documento",
        :condutor_cargo => "Condutor Cargo",
        :datahora_apresentacao => "Datahora Apresentacao",
        :oficio => false,
        :documentos_pessoais => false,
        :decisao => false,
        :corpo_delito => false,
        :certidao_antecedente_criminal => false,
        :kit_vestuario => false
      )
    ])
  end

  it "renders a list of socioeduk/jovem_recepcoes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Bo".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Nome Responsavel".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Presenca Familiar Junto".to_s, :count => 2
    assert_select "tr>td", :text => "Condutor Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Condutor Documento".to_s, :count => 2
    assert_select "tr>td", :text => "Condutor Cargo".to_s, :count => 2
    assert_select "tr>td", :text => "Datahora Apresentacao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
