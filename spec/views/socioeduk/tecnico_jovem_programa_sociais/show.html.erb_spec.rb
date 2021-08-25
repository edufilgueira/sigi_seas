require 'rails_helper'

RSpec.describe "socioeduk/tecnico_jovem_programa_sociais/show", type: :view do
  before(:each) do
    @socioeduk_tecnico_jovem_programa_social = assign(:socioeduk_tecnico_jovem_programa_social, Socioeduk::TecnicoJovemProgramaSocial.create!(
      :socioeduk_tecnico_jovem => nil,
      :socioeduk_programa_social => nil
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
