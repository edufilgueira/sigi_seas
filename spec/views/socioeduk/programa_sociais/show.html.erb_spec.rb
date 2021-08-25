require 'rails_helper'

RSpec.describe "socioeduk/programa_sociais/show", type: :view do
  before(:each) do
    @socioeduk_programa_social = assign(:socioeduk_programa_social, Socioeduk::ProgramaSocial.create!(
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
