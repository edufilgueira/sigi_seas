require 'rails_helper'

RSpec.describe "socioeduk/jovem_apreensoes/show", type: :view do
  before(:each) do
    @socioeduk_jovem_apreensao = assign(:socioeduk_jovem_apreensao, Socioeduk::JovemApreensao.create!(
      :socioeduk_jovem => nil,
      :antecedente_criminal => false,
      :qtd_processo_anterior => 2,
      :dia_delegacia => 3,
      :socioeduk_tipo_medida_socioeducativa => nil,
      :socioeduk_tipo_decisao_judicial => nil,
      :qtd_dia_internacao_medida => 4
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/4/)
  end
end
