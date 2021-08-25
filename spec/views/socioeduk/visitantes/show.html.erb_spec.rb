require 'rails_helper'

RSpec.describe "socioeduk/visitantes/show", type: :view do
  before(:each) do
    @socioeduk_visitante = assign(:socioeduk_visitante, Socioeduk::Visitante.create!(
      :nome => "Nome",
      :socioeduk_jovem => nil,
      :socioeduk_tipo_documento => nil,
      :numero => "Numero",
      :uf_documento => 2,
      :foto => "Foto",
      :observação => "MyText",
      :anexo => "Anexo"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Foto/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Anexo/)
  end
end
