require 'rails_helper'

RSpec.describe "socioeduk/disciplina_escolaridades/show", type: :view do
  before(:each) do
    @socioeduk_disciplina_escolaridade = assign(:socioeduk_disciplina_escolaridade, Socioeduk::DisciplinaEscolaridade.create!(
      :socioeduk_escolaridade => nil,
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Descricao/)
  end
end
