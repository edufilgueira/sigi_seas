require 'rails_helper'

RSpec.describe "socioeduk/jovem_recepcoes/show", type: :view do
  before(:each) do
    @socioeduk_jovem_recepcao = assign(:socioeduk_jovem_recepcao, Socioeduk::JovemRecepcao.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Bo/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Nome Responsavel/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Presenca Familiar Junto/)
    expect(rendered).to match(/Condutor Nome/)
    expect(rendered).to match(/Condutor Documento/)
    expect(rendered).to match(/Condutor Cargo/)
    expect(rendered).to match(/Datahora Apresentacao/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
