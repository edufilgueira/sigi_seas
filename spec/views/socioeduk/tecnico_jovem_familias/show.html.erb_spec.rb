require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_familias/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_familia = assign(:socioeduk_tecnico_jovem_familia, Socioeduk::TecnicoJovemFamilia.create!(
      :socioeduk_tecnico_jovem => nil,
      :nome => "Nome",
      :socioeduk_escolaridade => nil,
      :profissao => "Profissao",
      :socioeduk_tipo_parentesco => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Profissao/)
    expect(rendered).to match(//)
  end
end
