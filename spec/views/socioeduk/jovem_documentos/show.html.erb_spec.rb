require 'rails_helper'

RSpec.describe "socioeduk/jovem_documentos/show", type: :view do
  before(:each) do
    @socioeduk_jovem_documento = assign(:socioeduk_jovem_documento, Socioeduk::JovemDocumento.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_documento => nil,
      :numero => "Numero",
      :origem_documento => 2,
      :destino_documento => 3
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
