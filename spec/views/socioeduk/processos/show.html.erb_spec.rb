require 'rails_helper'

RSpec.describe "socioeduk/processos/show", type: :view do
  before(:each) do
    @socioeduk_processo = assign(:socioeduk_processo, Socioeduk::Processo.create!(
      :numero_processo => "Numero Processo",
      :socioeduk_tipo_processo => nil,
      :socioeduk_comarca => nil,
      :numero_oficio => "Numero Oficio",
      :socioeduk_situacao_processo => nil,
      :socioeduk_municipio => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Numero Processo/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero Oficio/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
